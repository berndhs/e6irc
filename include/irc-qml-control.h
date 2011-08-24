#ifndef EGALITE_IRC_QML_CONTROL_H
#define EGALITE_IRC_QML_CONTROL_H

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
#include "irc-float.h"
#include "irc-socket.h"
#include "irc-known-server-model.h"
#include "irc-active-server-model.h"
#include <QFile>
#include <QStringList>
#include <QMap>
#include <QList>
#include <QSize>
#include <QPoint>
#include <QGraphicsObject>
#include <QDeclarativeView>

#define EGALITE_IRC_CONTROL_RESIZE 0


class QListWidgetItem;

namespace egalite 
{

class IrcAbstractChannel;
class IrcQmlChannelGroup;

class IrcQmlControl : public QObject
{
Q_OBJECT

public:

  IrcQmlControl (QObject *parent, QDeclarativeView * view);
  
  void fillContext ();

  int   OpenCount ();
  bool  IsRunning () { return isRunning; }

  void  CloseCleanup ();

  void  InChanMsg (IrcSocket * sock,
                   const QString & chan, 
                   const QString & form,
                   const QString & msg);
  void  InUserMsg (IrcSocket * sock,
                   const QString & from, 
                   const QString & to, 
                   const QString & msg);
  void  IncomingCtcpChan (IrcSocket * sock,
                   const QString & from, 
                   const QString & chan,
                   const QString & msg);
  void  IncomingCtcpUser (IrcSocket * sock,
                   const QString & from, 
                   const QString & to,
                   const QString & msg);

public slots:

  bool  Run ();
  void  EditServers ();
  void  EditChannels ();
  void  EditIgnores ();
  void  SendRaw (QString sockName, QString data);

private slots:

  void Exit ();
  void Exiting ();
  void TryConnect (const QString & host, int port);
  void TryDisconnect ();
  void DisconnectServer (IrcSocket * sock);
  void TryPart ();
  void ConnectionReady (IrcSocket * sock);
  void ConnectionGone (IrcSocket * sock);
  void ReceiveLine (IrcSocket * sock, QByteArray line);
  void ChangedHostName (IrcSocket * sock, QString name);
  void ChanActive (IrcAbstractChannel * chan);
  void ChanInUse (IrcAbstractChannel * chan);
  void ChanWantsDock (IrcAbstractChannel * chan);
  void ChanWantsFloat (IrcAbstractChannel * chan);
  void WantsFloatToggle (IrcAbstractChannel * chan);
  void ChanWantsClose (IrcAbstractChannel * chan);
  void HideChannel (IrcAbstractChannel * chanBox);
  void ShowChannel (IrcAbstractChannel * chanBox);
  void Send ();
  void WantsWhois (QString chan, QString otherUser, bool wantsit);

  void SetActiveServer (int row);
  void SetCurrentChannel (const QString & chan);
  void SetCurrentNick (const QString & nick);
  void Join ();
  void Login ();

  void Outgoing (QString chan, QString msg);
  void SeenWatchAlert (QString chanName, QString data);
  
  void ViewStatusChange (QDeclarativeView::Status status);

protected:

#if EGALITE_IRC_CONTROL_RESIZE
  void resizeEvent (QResizeEvent * event);
#endif

signals:

  void StatusChange ();
  void WatchAlert (QString message);

private:

  typedef QMap <QString, IrcAbstractChannel *>   
          ChannelMapType;
  typedef QMap <IrcAbstractChannel*, IrcFloat*>    
          FloatingMapType;
  typedef QMap <QString, IrcSocket *>
          SocketMapType;
  typedef QMap <QString, void (*) (IrcQmlControl*, IrcSocket *, const QString &,
                           const QString &, const QString &)>
          ReceiveMapType;
  typedef QMap <QString, void (*) (IrcQmlControl*, IrcSocket *, QString &, 
                                   QString &, QString &, QString &)>  
          XformMapType;
  typedef QMap <QString, void (*) (IrcQmlControl*, IrcSocket *, const QString &,
                           const QString &, const QString &)>
          CtcpMapType;

  void ConnectGui ();
  void Resize (qreal width, qreal height);
  void LoadLists ();
  void AddConnect (IrcSocket * sock);
  void NickLogin (const QString & nick, IrcSocket *sock);
  void TransformSend (IrcSocket * sock, const QString & chan, QString & data);

  void AddChannel (IrcSocket * sock, 
                   const QString & chanName, 
                   bool isRaw=false);
  void DropChannel (IrcSocket * sock, 
                    const QString & chanName);
  void PartAll (const QString & sockName);
  void SendData (const QString & data);
  void LogRaw (const QString & raw);
  void AddNames (const QString & chanName, 
                 const QString & names);
  void AddName (const QString & chanName, 
                const QString & name);
  void DropName (IrcSocket * sock, 
                  const QString & chanName, 
                  const QString & name,
                  const QString & msg = QString());
  void UserQuit (IrcSocket * sock, 
                 const QString & user, 
                 const QString & msg);
  void SetTopic (IrcSocket * sock, 
                 const QString & chanName, const QString & topic);
  void IncomingRaw (IrcSocket * sock, 
                    const QString & from,
                    const QString & msg);
  void WhoisData (const QString & thisUser,
                  const QString & otherUser,
                  const QString & numeric,
                  const QString & data);

  void ReceiveRaw (IrcSocket *sock, const QByteArray & line);

  static void SaveServer (const QString & name);
  static void SaveChannel (const QString & name);
  static void SaveIgnore (const QString & name);
  static void RemoveServer (const QString & name);
  static void RemoveChannel (const QString & name);
  static void RemoveIgnore (const QString & name);
  static QStringList LoadServers ();
  static QStringList LoadChannels ();
  static QStringList LoadIgnores ();


  QDeclarativeView   *dView;
  bool                initDone;
  QDeclarativeItem   *qmlObject;
  bool                isRunning;

  IrcQmlChannelGroup    *dockedChannels;

  SocketMapType       sockets;
  bool                isConnected;

  QString             noNameServer;
  QString             noNameNick;
  QString             noNameChannel;
  QString             rawServer;
  QString             rawHeader;
  QSize               oldSize;
  QPoint              oldPos;
  bool                hidSelf;

  XformMapType        commandXform;
  ReceiveMapType      receiveHandler;
  CtcpMapType         ctcpHandler;

  ChannelMapType      channels;
  FloatingMapType     floatingChannels;

  QList <QString>     ignoreSources;

  QMap <QString, QString>  whoisWait;

  KnownServerModel    *knownServers;
  ActiveServerModel   activeServers;
  NameListModel       channelModel;
  NameListModel       nickModel;

  IrcSocket          *selectedServer;
  QString             selectedChannel;
  QString             selectedNick;

  int                 fullHeight;
  int                 fullWidth;

  friend class IrcQmlSockStatic;
  friend class IrcCtcp;

};

} // namespace

#endif
