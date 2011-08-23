#ifndef IRC_SOCKET_H
#define IRC_SOCKET_H

/****************************************************************
 * This file is distributed under the following license:
 *
 * Copyright (C) 2010, Bernd Stramm
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

#include <QTcpSocket>
#include <QStringList>

class QTimer;
class QByteArray;

namespace egalite
{

class IrcSocket : public QTcpSocket
{
Q_OBJECT

public:

  IrcSocket (QObject *parent=0);

  QString Name ();
  QString HostName ();
  QString Nick () { return currentNick; }
  QString PartMsg () { return partMsg; }
  QString QuitMsg () { return quitMsg; }

  void    SetNick (const QString & nick) { currentNick = nick; }
  void    SetPartMsg (const QString & msg) { partMsg = msg; }
  void    SetQuitMsg (const QString & msg) { quitMsg = msg; }
  void    SetHostName (const QString & name);
  void    connectToHost ( const QString & hostName, 
                          quint16 port);

  void    DisconnectLater (int msecs=1000);

  void    Send (QString data);
  void    SendData (const QString & data);
  qint64  BytesIn ();
  qint64  BytesOut ();

public slots:

  void Disconnect ();

private slots:

  void DidConnect ();
  void DidDisconnect ();
  void Receive ();
  void RollScript ();
  void SendScriptHead ();
  void SendPing ();
  void SockError (QAbstractSocket::SocketError err);
  void CountBytesOut (qint64 bytes);

signals:

  void connected (IrcSocket * sock);
  void disconnected (IrcSocket * sock);
  void ChangedHostName (IrcSocket *, QString newName);
  void ReceivedLine (IrcSocket *, QByteArray line);
  void IOActivity ();

private:


  QString          hostName;
  bool             knowHostName;
  QString          currentNick;
  QString          partMsg;
  QString          quitMsg;
  QByteArray       lineData;
  QStringList      scriptLines;
  QTimer          *pingTimer;
  QTimer          *scriptTimer;
  bool             needPing;
  qint64           numBytesIn;
  qint64           numBytesOut;

  static int sockCount;

};

} // namespace

#endif

