
#include "irc-abstract-channel.h"

/****************************************************************
 * This file is distributed under the following license:
 *
 * Copyright (C) 2011, Bernd Stramm
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

#include <QMenuBar>
#include <QMenu>
#include <QAction>
#include <QDebug>
#include <QFocusEvent>
#include <QShowEvent>
#include <QEvent>
#include <QUrl>
#include <QDesktopServices>
#include <QDateTime>
#include <QFileDialog>
#include <QListWidgetItem>
#include <QDateTime>
#include <QtAlgorithms>
#include <QTreeWidget>
#include <QTreeWidgetItem>
#include <QApplication>
#include <QClipboard>
#include <QRegExp>
#include "html-mangle.h"

namespace egalite
{

IrcAbstractChannel::IrcAbstractChannel (const QString & name,
                              const QString & sock,
                              QObject *parent)
  :QObject (parent),
   chanName (name),
   sockName (sock),
   historyIndex (-1),
   namesModel (this),
   qmlItem (0),
   topmost (false),
   active (false),
   mentioned (false),
   logging (false)
{
  Connect ();
  SetTopic (tr("Channel %1").arg (chanName));
}

IrcAbstractChannel::~IrcAbstractChannel ()
{
  if (logging) {
    logFile.close();
    logging = false;
  }
}

void
IrcAbstractChannel::SetQmlItem (QObject * item)
{
  if (qmlItem) {
    disconnect (qmlItem, 0,0,0);
    QMetaObject::invokeMethod (qmlItem, "relinquished");
  }
  qmlItem = item;
  if (qmlItem == 0) {
    return;
  }
  connect (qmlItem, SIGNAL (userSend ()), this, SLOT (UserSend()));
  connect (qmlItem, SIGNAL (userUp()), this, SLOT (UserUp()));
  connect (qmlItem, SIGNAL (userDown()), this, SLOT (UserDown ()));
  connect (qmlItem, SIGNAL (activatedLink(const QString &)),
           this, SLOT (ActivatedCookedLink(const QString &)));
  connect (qmlItem, SIGNAL (wantPart()), this, SLOT (Part()));
  connect (qmlItem, SIGNAL (showControl()), this, SIGNAL (ShowControl()));
  connect (qmlItem, SIGNAL (toggleFloat()), this, SLOT (ToggleFloat ()));
  connect (qmlItem, SIGNAL (toggleLog()), this, SLOT (ToggleLog ()));
  qmlItem->setProperty ("channelName", chanName);
  qmlItem->setProperty ("logging",logging);
}

void
IrcAbstractChannel::ToggleFloat ()
{
  emit ToggleFloat (this);
}

void
IrcAbstractChannel::ToggleLog ()
{
  if (logging) {
    logFile.close ();
    if (qmlItem) {
      qmlItem->setProperty ("logging", false);
    }
    logging = false;
  } else {
    QString dateStamp = QDateTime::currentDateTimeUtc()
              .toString ("-yyyy-MM-dd-hh-mm-ss");
    QString filename = QFileDialog::getSaveFileName (0, 
               tr("Log file for %1").arg(Name()),
               QString ("./log-") + Name() + dateStamp + tr (".html"));
    if (!filename.isEmpty()) {
      logFile.setFileName (filename);
      logFile.open (QFile::WriteOnly);
      logging = true;
      if (qmlItem) {
        qmlItem->setProperty ("logging", true);
      }
      logFile.write (cookedLog.toUtf8());
    }
  }
}

void
IrcAbstractChannel::SetRaw (bool isRaw)
{
  raw = isRaw;
}

void IrcAbstractChannel::SetNick(const QString &nick)
{
  nickName = nick;
}

bool
IrcAbstractChannel::Raw ()
{
  return raw;
}

QRectF
IrcAbstractChannel::cookedBoundingRect () const
{
  if (qmlItem) {
    QVariant rectVar;
    QMetaObject::invokeMethod (qmlItem, "cookedBoundingRect",
             Q_RETURN_ARG (QVariant, rectVar));
    QRectF br = rectVar.toRectF();
    return br;
  }
  return QRectF ();
}
 
void
IrcAbstractChannel::SetTopmost (bool top)
{
  if (qmlItem) {
    topmost = top;
    qmlItem->setProperty ("topmost", top);
    if (topmost) {
      active = false;
    }
  }
}

void
IrcAbstractChannel::ParentSizeChanged (qreal width, qreal height, 
                                       qreal top, qreal left)
{
  if (qmlItem) {
    qDebug () << __PRETTY_FUNCTION__ 
       << " old height " <<  qmlItem->property("height");
    QMetaObject::invokeMethod (qmlItem, "setSize",
       Q_ARG (QVariant, QVariant (width)),
       Q_ARG (QVariant, QVariant (height)),
       Q_ARG (QVariant, QVariant (left)),
       Q_ARG (QVariant, QVariant (top)));
  }
}

bool
IrcAbstractChannel::Topmost ()
{
  return topmost;
}

bool
IrcAbstractChannel::IsActive ()
{
  return active;
}

bool
IrcAbstractChannel::IsMentioned ()
{
  return mentioned;
}


void
IrcAbstractChannel::SetActive (bool a)
{
  active = a;
}
void
IrcAbstractChannel::SetMentioned (bool m)
{
  mentioned = m;
}


NameListModel *
IrcAbstractChannel::userNamesModel ()
{
  return & namesModel;
}

void
IrcAbstractChannel::Connect ()
{
}

void
IrcAbstractChannel::CopyClip ()
{
  QClipboard * clip = QApplication::clipboard ();
  if (clip) {
    clip->setText (clipSave);
  }
}

void
IrcAbstractChannel::SetHost (const QString & hostName)
{
  //ui.serverLabel->setText (hostName);
}

void
IrcAbstractChannel::StartWatching (const QRegExp & watch)
{
  if (!watchList.contains (watch)) {
    watchList.append (watch);
  }
}

void
IrcAbstractChannel::StopWatching (const QRegExp & watch)
{
  watchList.removeAll (watch);
}

void
IrcAbstractChannel::CheckWatch (const QString & data)
{
  QList<QRegExp>::iterator lit;
  bool notSeen (true);
  for (lit=watchList.begin(); notSeen && lit != watchList.end(); lit++) {
    QRegExp rX = *lit;
    if (rX.indexIn (data,0) >= 0) {
      emit WatchAlert (chanName, data);
      notSeen = false;
    }
  }
}

void
IrcAbstractChannel::Close ()
{
  if (logging) {
    logFile.close ();
    logging = false;
  }
}

void
IrcAbstractChannel::Float ()
{
  emit WantFloat (this);
}

void
IrcAbstractChannel::Dock ()
{
  emit WantDock (this);
}

void
IrcAbstractChannel::Part ()
{
qDebug () << " -----------> PART parts " << chanName << partMsg;
  if (raw) {
    emit WantClose (this);
  } else {
    emit Outgoing (chanName, QString ("/part %1 :%2")
                                    .arg (chanName)
                                    .arg (partMsg));
  }
}

void
IrcAbstractChannel::Incoming (const QString & message,
                         const QString & rawMessage)
{
  QString cooked = HtmlMangle::Anchorize (message,
                         HtmlMangle::HttpExp(),
                         HtmlMangle::HtmlAnchor);
qDebug () << " cooked message " << cooked;
  QDateTime now = QDateTime::currentDateTime ();
  QString smalldate ("<span style=\"font-size:small\">"
                     "%1</span> %2");
  QString cookedLine;
  cookedLine.append ("<br>\n");
  cookedLine.append (smalldate
                          .arg (now.toString ("hh:mm:ss"))
                          .arg (cooked));
  cookedLog.append (cookedLine);
  UpdateCooked ();
  if (logging) {
    logFile.write (cookedLine.toUtf8());
    logFile.flush ();
  }
  CheckWatch (rawMessage.length() > 0 ? rawMessage : message);
  if (!rawMessage.startsWith(nickName)) { // was it just ourselves?
    emit Active (this);
  }
  if (rawMessage.indexOf(nickName,1) != -1) { // they mentioned us?
    emit MentionMe (this);
  }
}

void
IrcAbstractChannel::SetTopic (const QString & newTopic)
{
  topic = newTopic;
  RefreshTopic ();
}

void
IrcAbstractChannel::RefreshTopic ()
{
  QString cooked = HtmlMangle::Anchorize (topic,
                         HtmlMangle::HttpExp(),
                         HtmlMangle::HtmlAnchor);
  if (qmlItem) {
    qmlItem->setProperty ("channelTopic", cooked);
  }
}

void
IrcAbstractChannel::AddNames (const QString & names)
{
  qDebug () << __PRETTY_FUNCTION__ << names;
  if (names.trimmed().length() > 0) {
    QStringList newNames = names.split (QRegExp ("(\\s+)"));
    oldNames.append (newNames);
    RefreshNames ();
  }
}

void
IrcAbstractChannel::AddName (const QString & name)
{
qDebug () << " IrcAbstractChannel :: AddName " << name;
  if (oldNames.contains (name)) {
    return;
  }
  if (name.length() > 0) {
    oldNames.append (name);
    RefreshNames ();
  }
  AppendSmall (cookedLog, tr(" Enter: -&gt; %1").arg(name));
  UpdateCooked ();
}

void
IrcAbstractChannel::RefreshNames ()
{
  oldNames.removeDuplicates ();
  qSort (oldNames.begin(), oldNames.end(), IrcAbstractChannel::Less);
  namesModel.setStringList (oldNames);
  if (qmlItem) {
    qmlItem->setProperty ("userListCounter",
      tr("%1 Users").arg (oldNames.size()));
  }
}

void
IrcAbstractChannel::DropName (const QString & name, const QString & msg)
{
  if (!oldNames.contains (name)) {  // not mine - don't care
    return;
  }
  oldNames.removeAll (name);
  qSort (oldNames.begin(), oldNames.end(), IrcAbstractChannel::Less);
  namesModel.setStringList (oldNames);
  if (qmlItem) {
    qmlItem->setProperty ("userListCounter",
      tr("%1 Users").arg (oldNames.size()));
  }
  AppendSmall (cookedLog, tr(" Exit: &lt;- %1 %2").arg(name).arg(msg));
  UpdateCooked ();
}

void
IrcAbstractChannel::Link (const QUrl & url)
{
#if 0
  if (url.scheme () == "ircsender") {
    QString msg = ui.textEnter->text ();
    msg.append (url.userName());
    msg.append (": ");
    ui.textEnter->setText (msg);
  } else {
    QDesktopServices::openUrl (url);
  }
#endif
}

void
IrcAbstractChannel::ActivatedCookedLink (const QString & link)
{
  QUrl url (link);
  if (url.scheme () == "ircsender") {
    if (qmlItem) {
      QVariant msgVar;
      QMetaObject::invokeMethod (qmlItem, "userData",
         Q_RETURN_ARG (QVariant, msgVar));
      QString msg (msgVar.toString());
      msg.append (url.userName());
      msg.append (": ");
      QMetaObject::invokeMethod (qmlItem, "writeUserData",
         Q_ARG (QVariant, msg));
    }
  } else {
    QDesktopServices::openUrl (url);
  }
}

void
IrcAbstractChannel::AppendSmall (QString & log, const QString & line)
{
  log.append (QString ("<br>\n<span style=\"font-size: small\">%1</span>")
                       .arg (line));
}

void
IrcAbstractChannel::UpdateCooked ()
{
  if (qmlItem) {
    QMetaObject::invokeMethod (qmlItem, "setCookedLog",
            Q_ARG (QVariant, cookedLog));
  }
}

void
IrcAbstractChannel::ClickedUser (const QString & userName)
{
#if 0
  qDebug () << " clicked on user " << item->text ();
  if (item) {
    queryUser = item->text ();
    if (queryUser.startsWith (QChar ('@'))
        || queryUser.startsWith (QChar ('+'))) {
      queryUser.remove (0,1);
    }
    QPoint here = QCursor::pos();
    userMenu->exec (here);
  }
#endif
}

void
IrcAbstractChannel::Whois (const QString & queryUser)
{
  QStringList head;
  head << tr ("Whois info on");
  head << queryUser;
  QString query ("WHOIS %1");
  emit WantWhois (chanName, queryUser, true);
  emit OutRaw (sockName, query.arg (queryUser));
}

void
IrcAbstractChannel::WhoisData (const QString &otherUser,
                          const QString &numeric,
                          const QString &data)
{
  QStringList newinfo;
  QString theData (data.trimmed());
  if (numeric == "318") {
    emit WantWhois (chanName, otherUser, false);
    return;
  } else if (numeric == "311") { 
    newinfo << tr("User Name ") << theData;
  } else if (numeric == "312") { 
    newinfo << tr("Server") << theData;
  } else if (numeric == "313") {
    newinfo << tr("Op") << theData;
  } else if (numeric == "319") {
    if (theData.startsWith (QChar (':'))) {
      theData.remove (0,1);
    }
    newinfo << tr("Channels") << theData;
  } else if (numeric == "401") {
    newinfo << tr("Don't know") << theData;
  }
  cookedLog.append (QString ("WHOIS %1 %2<br>\n")
                    .arg (otherUser)
                    .arg (data));
  UpdateCooked ();
}

void
IrcAbstractChannel::HideMe ()
{
  emit HideChannel (this);
}

void
IrcAbstractChannel::HideGroup ()
{
  emit HideDock ();
}

void
IrcAbstractChannel::HideAll ()
{
  emit HideAllChannels ();
}
bool
IrcAbstractChannel::eventFilter (QObject * obj, QEvent * evt)
{
#if 0
  if (obj == ui.textEnter) {
    if (evt->type() == QEvent::KeyPress) {
      return DoHistory (ui.textEnter, history, evt, 
                        historyIndex, historyBottom);
    }
  }
#endif
  return QObject::eventFilter (obj, evt);
}

bool     
IrcAbstractChannel::event (QEvent *evt)
{
  QEvent::Type  tipo = evt->type();
  switch (tipo) {
  case QEvent::WindowActivate:
    emit InUse (this);
    break;
  default:
    break;
  }
  return QObject::event (evt);
}

bool
IrcAbstractChannel::Less (const  QString & left, const QString & right)
{
  return left.toLower() < right.toLower ();
}

void
IrcAbstractChannel::UserSend ()
{
  qDebug () << " User sending " ;
  bool sendout (true);
  if (qmlItem) {
    QVariant userData;
    QMetaObject::invokeMethod (qmlItem, "userData",
        Q_RETURN_ARG (QVariant, userData));
    QString data = userData.toString();
    qDebug () << "   user data " << data;
    if (data.trimmed().length() > 0) {
      QMetaObject::invokeMethod (qmlItem, "clearUserData");
      if (raw) {
        AlmostRaw (data);
      } else if (data == "/part") {
        Part ();
        sendout = false;
      } else if (data.startsWith ("/whois")) {
        data.remove (0, 6);
        Whois (data.trimmed());
        sendout = false;
      }
      if (sendout) {
        emit Outgoing (chanName, data);
      }
      history.append (data);
      history.removeDuplicates ();
      historyIndex = history.size();
    }
  }
}

void
IrcAbstractChannel::AlmostRaw (const QString & data)
{
  QString prepared (data);
  if (prepared == QString ("/part")) {
    emit WantClose (this);
    return;
  }
  if (prepared.startsWith("/msg")) {
    prepared.remove (0,4);
    prepared.prepend ("PRIVMSG");
  } else if (prepared.startsWith ("/part")) {
    prepared.remove (0,5);
    prepared.prepend ("PART");
  } else if (prepared.startsWith ("/whois")) {
    prepared.remove (0,6);
    prepared.prepend ("WHOIS");
  }
  emit OutRaw (sockName, prepared);
}

void
IrcAbstractChannel::UserUp ()
{
  qDebug () << " User Up arrow ";
  DoHistory (Qt::Key_Up, history, historyIndex, historyBottom);
}

void
IrcAbstractChannel::UserDown ()
{
  qDebug () << " User Down arrow ";
  DoHistory (Qt::Key_Down, history, historyIndex, historyBottom);
}

void
IrcAbstractChannel::DoHistory (
                       Qt::Key       key,
                       QStringList & hist,
                       int         & index,
                       QString     & bottom)
{
  if (qmlItem == 0) {
    return;
  }
  if (key == Qt::Key_Up) {
    if (hist.size() == 0) {
      return ;
    }
    if (index >= hist.size()) { // at bottom
      QVariant bottomVar;
      QMetaObject::invokeMethod (qmlItem, "userData",
          Q_RETURN_ARG (QVariant, bottomVar));
      bottom = bottomVar.toString();
    } 
    index--;
    if (index < 0) {
      index = -1;
    } else {
      QMetaObject::invokeMethod (qmlItem, "writeUserData",
         Q_ARG (QVariant, hist.at(historyIndex)));
    }
  } else if (key == Qt::Key_Down) {
    if (hist.size() == 0) {
      return;
    }
    index++;
    if (index >= hist.size()) {
      index = hist.size();
      QMetaObject::invokeMethod (qmlItem, "writeUserData",
         Q_ARG (QVariant, bottom));
    } else {
      QMetaObject::invokeMethod (qmlItem, "writeUserData",
         Q_ARG (QVariant, hist.at(index)));
    }
  }
}


} // namespace
