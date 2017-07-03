#ifndef IRC_CHANNEL_GROUP_H
#define IRC_CHANNEL_GROUP_H

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

//#include "qml-view.h"

#include <QIcon>
#include <QWidget>
#include <QGraphicsObject>
#include <QDeclarativeItem>
#include <QDeclarativeEngine>
#include <QDeclarativeView>
#include <QStringList>
#include <QList>
#include <QTimer>
#include <QSettings>

class QCloseEvent;

namespace egalite
{

class IrcAbstractChannel;

class IrcQmlChannelGroup : public QObject
{
Q_OBJECT

public:

  IrcQmlChannelGroup (QObject *parent, QDeclarativeView * view);

  void Start ();

  void AddChannel (IrcAbstractChannel * chan);
  void RemoveChannel (IrcAbstractChannel * chan);
  void MarkActive (IrcAbstractChannel * chan, bool active);
  void NickMentioned (IrcAbstractChannel *chan, bool mentioned);
  bool HaveChannel (IrcAbstractChannel * chan);
  void ShowChannel (IrcAbstractChannel * chan);

  void reportChannels (QSettings & zettings);
 
  void Close ();

signals:

  void foundMention();
  void seeUser();
  void exitPgm();

public slots:


private slots:

  void ClickedChannel (QString link);
  void ChangedChannelBox (qreal newWidth, qreal newHeight,
                          qreal leftMargin = -1, qreal topMargin = -1);
  void DebugCheck ();

private:

  QString  ChannelMask (const QString & txt, bool active, bool mentioned, bool top);
  QString  ChannelAnchor (const QString & name, bool isMentioned=false);
  void     SetChannelList ();
  void     SetTopmostChannel (IrcAbstractChannel * topChan);
  void     SetTopmostChannel (const QString & topName);

  QDeclarativeView       *dView;
  QIcon                   activeIcon;
  QIcon                   quietIcon;
  QDeclarativeItem       *qmlObject;
  QList <IrcAbstractChannel*>  channelList;
  QTimer                  debugTimer;
  QString                 chanLinkPrefix;
  QString                 channelMaskActive;
  QString                 channelMaskMentioned;
  QString                 channelMaskIdle;

};

} // namespace

#endif
