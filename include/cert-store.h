#ifndef CERT_STORE_H
#define CERT_STORE_H

/****************************************************************
 * This file is distributed under the following license:
 *
 * Copyright (C) 2010,2011, Bernd Stramm
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
 ****************************************************************/

#include <QString>
#include <QDialog>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QStringList>

class QStandardItemModel;
class QStandardItem;

namespace egalite
{


class CertGenerate;

/** \brief CertStore keep track of SSL identities defined by certificates, and
  *  keep track of contact addresses for direct contacts.
  *
  * This serves as a Singleton storage container. It also has a gui edit facility.
  * 
  */

class CertStore : public QObject
{
Q_OBJECT

public:

  enum  RemoteType { Remote_White = 0,
                     Remote_Black = 1
                   };


  static CertStore & IF();
  static CertStore * Object();
  
  void Init ();

  QStringList IrcServers ();
  QStringList IrcNicks ();
  QStringList IrcChannels ();
  QStringList IrcIgnores ();
  QStringList IrcServers (const QString & channel);
  QStringList IrcChannels (const QString & server);
  bool        GetIrcIdent (const QString & nick, 
                                 QString & realname, 
                                 QString & pass);
  bool        GetIrcMessages (const QString & nick,
                                    QString & partMsg,
                                    QString & quitMsg);
  void        SaveIrcServer (const QString & server);
  void        SaveIrcChannel (const QString & chan);
  void        SaveServerList (const QString & chan,
                              const QStringList & servers);
  void        SaveChannelList (const QString & server,
                               const QStringList & channels);
  void        SaveIrcNick (const QString & nick,
                           const QString & realname = QString(), 
                           const QString & pass = QString());
  void        SaveIrcMessages (const QString & nick,
                               const QString & partMsg,
                               const QString & quitMsg);
  void        SaveIrcIgnore (const QString & name);
  bool        RemoveIrcServer (const QString & server);
  bool        RemoveIrcNick (const QString & nick);
  bool        RemoveIrcChannel (const QString & chan);
  bool        RemoveIrcIgnore (const QString & name);
  bool        RemoveIrcChannelServers (const QString & chan);
  bool        RemoveIrcServerChannels (const QString & server);

public slots:

private slots:
private:

  CertStore ();

  void Connect ();
  void ReadDB ();
  void CheckExists (const QString filename);
  void CheckDBComplete (const QString filename);
  void MakeElement (const QString name);

  QString ElementType (QString name);
 
  bool RemoveIrc (const QString & keytype,
                  const QString & keyval,
                  const QString & table);
  void IrcGetList (const QString & qryCmd, QStringList & result);

  QString          dbFileName;
  QSqlDatabase     certDB;
  QString          conName;
  bool             viewDetails;

  QStringList     dbElementList;

  QString         lastDirUsed;

  static CertStore * instance;

};

} // namespace

#endif
