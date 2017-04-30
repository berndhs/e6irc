
#include "irc-qml-channel-group.h"

/****************************************************************
 * This file is distributed under the following license:
 *
 * Copyright (C) 2017, Bernd Stramm
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
#include <QIcon>
#include <QCloseEvent>
#include <QMessageBox>
#include <QMetaObject>
#include <QDeclarativeItem>
#include <QRectF>
#include <QSound>
#include <QTime>

#include "irc-abstract-channel.h"
#include "qml-text-browser.h"
#include "dchat-magic.h"

namespace egalite
{

IrcQmlChannelGroup::IrcQmlChannelGroup (QObject *parent, QDeclarativeView * view)
  :QObject (parent),
    dView (view),
    qmlObject (0),
    debugTimer (this),
    chanLinkPrefix
    ("chanlink://channel_"),
    channelMaskActive
    ("["
     "<span "
     "style=\"color: red\"; font-weight: normal\">"
     " ? "
     "</span>"
     "%1] "),
    channelMaskMentioned
    ("["
      "<span "
      "style=\"color: red\"; font-style: italic; font-weight: bold\">"
      " ! "
      "</span>"
      "%1] "
      ),
    channelMaskIdle
    ("[%1] ")
{
  activeIcon = QIcon (":/ircicons/active.png");
  quietIcon = QIcon (":/ircicons/inactive.png");
  connect (&debugTimer, SIGNAL (timeout()),
           this, SLOT (DebugCheck()));
  debugTimer.start (30*1000);
  QTimer::singleShot (10000, this, SLOT (DebugCheck()));
}

void
IrcQmlChannelGroup::Start ()
{

  QObject *root = dView->rootObject();
  if (root == 0) {
    return;
  }
  qmlObject  = root->findChild<QDeclarativeItem*>("ChannelGroup");
  qDebug () << __PRETTY_FUNCTION__ << " qml object " << qmlObject;
  if (qmlObject == 0) {
    return;
  }
  connect (qmlObject, SIGNAL (selectedChannel (QString)),
           this, SLOT (ClickedChannel (QString)));
  connect (qmlObject, SIGNAL (changedChannelBox (qreal, qreal)),
           this, SLOT (ChangedChannelBox (qreal, qreal)));
}

void
IrcQmlChannelGroup::SetChannelList ()
{
  if (qmlObject) {
    bool someMention(false);
    QString chanAnchList;
    int nc = channelList.count ();
    IrcAbstractChannel::someMention = false;
    for (int i=0; i<nc; i++) {
       IrcAbstractChannel * chan = channelList.at(i);
       if (chan) {
         bool ment = chan->IsMentioned();
         someMention |= ment;
         bool acti = chan->IsActive();
         chanAnchList.append (
//               QString("%1%2").arg(ment).arg(acti) +
               (ment ?
                  channelMaskMentioned :
                  (acti ? channelMaskActive
                                    : channelMaskIdle))
                  .arg(ChannelAnchor (chan->Name(),ment))
               );
       }
    }
    for (int i=0; i<nc; i++) {
       IrcAbstractChannel * chan = channelList.at(i);
       if (chan) {
         chan->SetMentioned(false);
       }
    }
    if (someMention) {
      QTime t0 = QTime::currentTime();
      t0.start();
      QFile bf (":/sounds/beep.wav");
      qDebug() << Q_FUNC_INFO << "file " << bf.fileName()
               << " exists " << bf.exists();
      QSound beep (":/sounds/beep.wav");
      qDebug() << beep.fileName();
      beep.setLoops(1);
      beep.play();
      qDebug() << Q_FUNC_INFO << "done playing" << beep.isFinished();

      qDebug() << Q_FUNC_INFO << "time taken from " << t0.elapsed();
    }
    QMetaObject::invokeMethod (qmlObject, "setChannelList",
             Q_ARG (QVariant, nc),
             Q_ARG (QVariant, chanAnchList));
  }
}

void
IrcQmlChannelGroup::AddChannel (IrcAbstractChannel * newchan)
{
  qDebug () << __PRETTY_FUNCTION__ << newchan << " in " << qmlObject;
  if (newchan == 0) {
    return;
  }
  QVariant chanObjVar;
  QMetaObject::invokeMethod (qmlObject, "addChannel",
              Qt::DirectConnection,
              Q_RETURN_ARG (QVariant, chanObjVar));
  QObject *chanObj = chanObjVar.value<QObject*>();
  qDebug () << __PRETTY_FUNCTION__ << " addChannel from qml returns " << chanObj;
  if (chanObj) {
    chanObj->setProperty ("boxLabel",newchan->Name());
    QObject * model = qobject_cast<QObject*>(newchan->userNamesModel());
    QMetaObject::invokeMethod (chanObj, "setModel",
        Q_ARG (QVariant, qVariantFromValue (model)));
    newchan->SetQmlItem (qobject_cast<QDeclarativeItem*>(chanObj));
    channelList << newchan;
    SetTopmostChannel (newchan);
    SetChannelList ();
  }
  newchan->UpdateCooked ();
  newchan->RefreshNames();
  newchan->RefreshTopic();
}

QString
IrcQmlChannelGroup::ChannelAnchor (const QString & name, bool isMentioned)
{
  if (isMentioned) {
    return QString("<a href=\"%2%1\" style=\"color: red\">%1</a>")
        .arg(name).arg (chanLinkPrefix);
  } else {
    return QString("<a href=\"%2%1\"style=\"color: green\">%1</a>")
        .arg(name).arg (chanLinkPrefix);
  }
}

void
IrcQmlChannelGroup::RemoveChannel (IrcAbstractChannel * chan)
{
  qDebug () << __PRETTY_FUNCTION__ << chan;
  if (chan) {
    channelList.removeAll (chan);
    if (chan->Topmost() && !channelList.isEmpty()) {
      SetTopmostChannel (channelList.last());
    }
    SetChannelList ();
  }
}

void
IrcQmlChannelGroup::SetTopmostChannel (IrcAbstractChannel * topChan)
{
  int nc = channelList.count();
  for (int i=0; i<nc; i++) {
    IrcAbstractChannel *chan = channelList.at(i);
    chan->SetTopmost (chan == topChan);
  }
}

void
IrcQmlChannelGroup::SetTopmostChannel (const QString & topName)
{
  int nc = channelList.count();
  for (int i=0; i<nc; i++) {
    IrcAbstractChannel *chan = channelList.at(i);
    chan->SetTopmost (chan->Name() == topName);
  }
  
}

void
IrcQmlChannelGroup::ClickedChannel (QString link)
{
  if (link.startsWith (chanLinkPrefix)) {
    QString name (link);
    name.remove (0,chanLinkPrefix.length());
    SetTopmostChannel (name);
    SetChannelList ();
  }
}

void
IrcQmlChannelGroup::ChangedChannelBox (qreal newWidth, qreal newHeight,
                                       qreal leftMargin, qreal topMargin)
{
  int nc = channelList.count();
  for (int i=0; i<nc; i++) {
    channelList.at(i)->ParentSizeChanged (newWidth, newHeight, 
                                          leftMargin, topMargin);
  }
}

void
IrcQmlChannelGroup::MarkActive (IrcAbstractChannel * chan, bool active)
{
  if (chan) {
    chan->SetActive (active);
  }
  SetChannelList ();
}

void
IrcQmlChannelGroup::NickMentioned(IrcAbstractChannel *chan, bool mentioned)
{
  qDebug() << Q_FUNC_INFO << chan << mentioned;
  if (chan) {
    chan->SetMentioned(mentioned);
  }
  if (IrcAbstractChannel::someMention) {
    SetChannelList();
  }
}

bool
IrcQmlChannelGroup::HaveChannel (IrcAbstractChannel * chan)
{
  if (chan) {
    return channelList.contains (chan);
  }
  return false;
}

void
IrcQmlChannelGroup::Close ()
{
}

void
IrcQmlChannelGroup::ShowChannel (IrcAbstractChannel *chan)
{
}

void
IrcQmlChannelGroup::DebugCheck ()
{
  qDebug () << "IrcQmlChannelGroup :: DebugCheck ";
  int nc = channelList.count();
  for (int i=0; i<nc; i++) {
    IrcAbstractChannel * chan = channelList.at(i);
    qDebug () << " channel " << chan->Name() << " bounds "
              << chan->cookedBoundingRect ();
  }
}

} // namespace
