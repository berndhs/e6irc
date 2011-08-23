#ifndef IRC_CHANNEL_GROUP_H
#define ITC_CHANNEL_GROUP_H

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

class QCloseEvent;

namespace egalite
{

class IrcAbstractChannel;

class IrcQmlChannelGroup : public QDeclarativeView
{
Q_OBJECT

public:

  IrcQmlChannelGroup (QWidget *parent=0);

  void Start ();

  void AddChannel (IrcAbstractChannel * chan);
  void RemoveChannel (IrcAbstractChannel * chan);
  void MarkActive (IrcAbstractChannel * chan, bool active);
  bool HaveChannel (IrcAbstractChannel * chan);
  void ShowChannel (IrcAbstractChannel * chan);
 
  void Close ();

public slots:

  void show ();
  void hide ();

private slots:

  void ClickedChannel (QString link);
  void ChangedChannelBox (qreal newWidth, qreal newHeight,
                          qreal leftMargin, qreal topMargin);
  void DebugCheck ();

protected:

  void closeEvent (QCloseEvent *event);
  void resizeEvent (QResizeEvent * event); 

private:

  QString  ChannelAnchor (const QString & name);
  void     SetChannelList ();
  void     SetTopmostChannel (IrcAbstractChannel * topChan);
  void     SetTopmostChannel (const QString & topName);

  QIcon                   activeIcon;
  QIcon                   quietIcon;
  QGraphicsObject        *qmlRoot;
  QList <IrcAbstractChannel*>  channelList;
  QTimer                  debugTimer;
  QString                 chanLinkPrefix;
  QString                 channelMaskActive;
  QString                 channelMaskIdle;

};

} // namespace

#endif
