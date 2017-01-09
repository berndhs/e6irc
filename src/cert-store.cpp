
/****************************************************************
 * This file is distributed under the following license:
 *
 * Copyright (C) 2017,2017, Bernd Stramm
 *
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 2
 *  of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, 
 *  Boston, MA  02110-1301, USA.
 *****************************************************************/

#include "cert-store.h"
#include "deliberate.h"

#include <QStandardPaths>
#include <QStandardItemModel>
#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QDateTime>
#include <QApplication>
#include <QClipboard>
#include <QMessageBox>
#include <QTimer>
#include <QDebug>

using namespace deliberate;

namespace egalite
{

CertStore * CertStore::instance (0);

CertStore & 
CertStore::IF ()
{
  if (instance == 0) {
    instance = new CertStore;
  }
  return *instance;
}

CertStore *
CertStore::Object ()
{
  if (instance == 0) {
    instance = new CertStore;
  }
  return instance;
}

CertStore::CertStore ()
  :QObject (0),
   lastDirUsed ("")
{
  dbElementList 
                << "ircservers"
                << "uniqueircserver"
                << "ircchannels"
                << "uniquechannel"
                << "ircnicks"
                << "uniqueircnick"
                << "ircignore"
                << "uniqueircignore"
                << "ircmessages"
                << "uniqueircmsgs"
                << "ircchannelservers";
}

void
CertStore::Connect ()
{


}

void
  CertStore::Init ()
{
  bool initDone (false);
  if (initDone) {
    return;
  }
  initDone = true;
  dbFileName =  QStandardPaths::writableLocation
              (QStandardPaths::ConfigLocation)
              + QDir::separator()
              + QString ("addressing.sql");
  dbFileName = Settings().value ("files/addressing",dbFileName).toString();
  Settings().setValue ("files/addressing",dbFileName);
  qDebug () << "trying for dbname " << dbFileName;

  conName = QString ("addressingDB");
  certDB = QSqlDatabase::addDatabase ("QSQLITE",conName);
  CheckExists (dbFileName);
  certDB.setDatabaseName (dbFileName);
  certDB.open ();
  CheckDBComplete (dbFileName);
}


void
CertStore::CheckExists (const QString filename)
{
  QFileInfo dbfileInfo (filename);
  if (!dbfileInfo.exists()) {
    QDir dir (dbfileInfo.absolutePath());
    dir.mkpath (dbfileInfo.absolutePath());
    QFile file (filename);
    file.open (QFile::ReadWrite);
    file.write (QByteArray (""));
    file.close();
  }
}

void
CertStore::CheckDBComplete (const QString filename)
{
  CheckExists (filename);
  QStringList::iterator  elit;
  QString el_name;
  for (elit = dbElementList.begin (); elit != dbElementList.end (); elit++) {
    el_name = *elit;
    QString kind = ElementType (el_name).toUpper();
    if (kind != "TABLE" && kind != "INDEX") {
      MakeElement (el_name);
    }
  }
}

QString
CertStore::ElementType (QString name)
{
  QSqlQuery query (certDB);
  QString cmdPat ("select * from main.sqlite_master where name=\"%1\"");
  QString cmd = cmdPat.arg (name);
  bool ok = query.exec (cmd);
  if (ok && query.next()) {
    QString tipo = query.value (0).toString();
    return tipo;
  }
  return QString ("none");
}

void
CertStore::MakeElement (const QString elem)
{
  QString filename = QString (":/schemas/%1.sql").arg (elem);
  QFile schemafile (filename);
  schemafile.open (QFile::ReadOnly);
  QByteArray createcommands = schemafile.readAll ();
  schemafile.close ();
  QString querytext (createcommands);
  QSqlQuery qry (certDB);
  qry.prepare (querytext);
  bool done = qry.exec ();
qDebug () << " making  element " << elem << done;
qDebug () << "    using " << qry.executedQuery();
}

QStringList
CertStore::IrcServers ()
{
  QStringList list;
  IrcGetList ("select name from ircservers", list);
  return list;
}

QStringList
CertStore::IrcNicks ()
{
  QStringList list;
  IrcGetList ("select inick from ircnicks", list);
  return list;
}

QStringList
CertStore::IrcIgnores ()
{
  QStringList list;
  IrcGetList ("select name from ircignore", list);
  return list;
}

void
CertStore::IrcGetList (const QString & qryCmd, QStringList & result)
{
  result.clear();
  QSqlQuery query (certDB);
  bool ok = query.exec (qryCmd);
  while (ok && query.next()) {
    result << query.value (0).toString();
  }
}

QStringList
CertStore::IrcChannels ()
{
  QStringList list;
  IrcGetList ("select channame from ircchannels", list);
  return list;
}

bool
CertStore::RemoveIrc (const QString & keytype,
                      const QString & keyval,
                      const QString & table)
{
  QString cmdString = QString ("delete from %1 where %2 == \"%3\"")
                    .arg (table)
                    .arg (keytype)
                    .arg (keyval);
  QSqlQuery query (certDB);
  bool ok = query.exec (cmdString);
qDebug () << " query " << ok << query.executedQuery();
  return ok;
}

bool
CertStore::RemoveIrcServer (const QString & server)
{
  return RemoveIrc ("name",server,"ircservers");
}

bool
CertStore::RemoveIrcNick (const QString & nick)
{
  bool ok = RemoveIrc ("inick", nick, "ircnicks");
  ok |= RemoveIrc ("inick", nick, "ircmessages");
  return ok;
}

bool
CertStore::RemoveIrcChannel (const QString & chan)
{
  return RemoveIrc ("channame", chan, "ircchannels");
}

bool
CertStore::RemoveIrcIgnore (const QString & name)
{
  return RemoveIrc ("name", name, "ircignore");
}

void
CertStore::SaveIrcNick (const QString & nick,
                        const QString & realname,
                        const QString & pass)
{
  QString therealname (realname);
  if (therealname.length() < 1) {
    therealname = nick;
  }
  QString cmd ("insert or replace into ircnicks "
                  " (inick, ipass, realname) "
                  " values (?, ?, ?) ");
  QSqlQuery query (certDB);
  query.prepare (cmd);
  query.bindValue (0, QVariant (nick));
  query.bindValue (1, QVariant (pass));
  query.bindValue (2, QVariant (therealname));
  bool ok = query.exec ();
  qDebug () << " query " << ok << query.executedQuery ();
}

void
CertStore::SaveIrcMessages (const QString & nick,
                        const QString & partMsg,
                        const QString & quitMsg)
{
  QString cmd ("insert or replace into ircmessages "
                  " (inick, partmsg, quitmsg) "
                  " values (?, ?, ?) ");
  QSqlQuery query (certDB);
  query.prepare (cmd);
  query.bindValue (0, QVariant (nick));
  query.bindValue (1, QVariant (partMsg));
  query.bindValue (2, QVariant (quitMsg));
  bool ok = query.exec ();
  qDebug () << " query " << ok << query.executedQuery ();
}

void
CertStore::SaveIrcChannel (const QString & chan)
{
  QString cmd ("insert or replace into ircchannels "
               " (channame) "
               " values (?) ");
  QSqlQuery query (certDB);
  query.prepare (cmd);
  query.bindValue (0, QVariant (chan));
  bool ok = query.exec ();
  qDebug () << " query " << ok << query.executedQuery ();
}

void
CertStore::SaveIrcServer (const QString & server)
{
  QString cmd ("insert or replace into ircservers "
               " (name) "
               " values (?) ");
  QSqlQuery query (certDB);
  query.prepare (cmd);
  query.bindValue (0, QVariant (server));
  bool ok = query.exec ();
  qDebug () << " query " << ok << query.executedQuery ();
}

void
CertStore::SaveIrcIgnore (const QString & name)
{
  QString cmd ("insert or replace into ircignore "
               " (name) "
               " values (?) ");
  QSqlQuery query (certDB);
  query.prepare (cmd);
  query.bindValue (0, QVariant (name));
  bool ok = query.exec ();
  qDebug () << " query " << ok << query.executedQuery ();
}


bool
CertStore::GetIrcIdent(const QString & nick,
                             QString & realname, 
                             QString & pass)
{
  QString cmdPat ("select ipass, realname from ircnicks "
                  " where inick == \"%1\"");
  QSqlQuery query (certDB);
  bool ok = query.exec (cmdPat.arg (nick));
  if (ok && query.next ()) {
    pass = query.value (0).toString ();
    realname = query.value (1).toString ();
  qDebug () << " query " << ok << query.executedQuery ();
    return true;
  }
  return false;
}

bool
CertStore::GetIrcMessages(const QString & nick,
                             QString & partMsg, 
                             QString & quitMsg)
{
  QString cmdPat ("select partmsg, quitmsg from ircmessages "
                  " where inick == \"%1\"");
  QSqlQuery query (certDB);
  bool ok = query.exec (cmdPat.arg (nick));
  if (ok && query.next ()) {
    partMsg = query.value (0).toString ();
    quitMsg = query.value (1).toString ();
  qDebug () << " query " << ok << query.executedQuery ();
    return true;
  }
  return false;
}

QStringList
CertStore::IrcServers (const QString & channel)
{
  QStringList servers;
  QString cmdPat ("select server from ircchannelservers "
                  " where channel == \"%1\"");
  QSqlQuery query (certDB);
  bool ok = query.exec (cmdPat.arg (channel));
  while (ok && query.next ()) {
    QString s (query.value(0).toString());
    if (s.length() > 0) {
      servers << s;
    }
  }
  return servers;
}

QStringList
CertStore::IrcChannels (const QString & server)
{
  QStringList channels;
  QString cmdPat ("select channel from ircchannelservers "
                  " where server == \"%1\"");
  QSqlQuery query (certDB);
  bool ok = query.exec (cmdPat.arg (server));
  while (ok && query.next ()) {
    QString c (query.value(0).toString());
    if (c.length() > 0) {
      channels << c;
    }
  }
  return channels;
}

void
CertStore::SaveChannelList (const QString & server,
                            const QStringList & channels)
{
  if (server.length() < 1) {
    return;
  }
  QSqlQuery query (certDB);
  QString cmd ("insert or replace into ircchannelservers "
               " (channel, server) "
               " values (?,?) ");
  int nc = channels.count ();
  for (int i=0; i<nc; i++) {
    QString c (channels.at(i));
    if (c.length() > 0) {
      query.prepare (cmd);
      query.bindValue (0,QVariant (c));
      query.bindValue (1,QVariant (server));
      query.exec ();
    }
  }
}

void
CertStore::SaveServerList (const QString & chan,
                            const QStringList & servers)
{
  if (chan.length() < 1) {
    return;
  }
  QSqlQuery query (certDB);
  QString cmd ("insert or replace into ircchannelservers "
               " (channel, server) "
               " values (?,?) ");
  int ns = servers.count ();
  for (int i=0; i<ns; i++) {
    QString s (servers.at(i));
    if (s.length() > 0) {
      query.prepare (cmd);
      query.bindValue (0,QVariant (s));
      query.bindValue (1,QVariant (chan));
      query.exec ();
    }
  }
}

} // namespace

