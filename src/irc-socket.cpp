
#include "irc-socket.h"

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

#include <QByteArray>
#include <QStringList>
#include <QTimer>
#include <QHostAddress>
#include <QMessageBox>
#include <QVariant>
#include "irc-qml-control.h"
#include "reconnector.h"
#include "deliberate.h"

namespace egalite
{

int IrcSocket::sockCount (0);

IrcSocket::IrcSocket (QObject *parent)
  :QTcpSocket (parent),
   needPing (true),
   numBytesIn (0),
   numBytesOut (0),
   onTheWayOut(false)
{
  sockCount++;
  setObjectName (QString("IrcSocket-%1").arg(sockCount));
  hostName = objectName ();
  pingTimer = new QTimer (this);
  scriptTimer = new QTimer (this);
  connect (pingTimer, SIGNAL (timeout()),
           this, SLOT (SendPing()));
  connect (scriptTimer, SIGNAL (timeout()), 
           this, SLOT (SendScriptHead()));
  connect (this, SIGNAL (error (QAbstractSocket::SocketError)),
           this, SLOT (SockError (QAbstractSocket::SocketError)));
  connect (this, SIGNAL (connected()),
           this, SLOT (DidConnect ()));
  connect (this, SIGNAL (disconnected ()),
           this, SLOT (DidDisconnect ()));
  connect (this, SIGNAL (readyRead ()),
           this, SLOT (Receive ()));
  connect (this, SIGNAL (bytesWritten (qint64)),
           this, SLOT (CountBytesOut (qint64)));
qDebug () << " IrcSocket " << objectName();
}

void
IrcSocket::CountBytesOut (qint64 bytes)
{
  numBytesOut += bytes;
  emit IOActivity ();
}

qint64 
IrcSocket::BytesIn ()
{
  return numBytesIn;
}

qint64
IrcSocket::BytesOut ()
{
  return numBytesOut;
}

void
IrcSocket::connectToHost ( const QString & hostName, 
                          quint16 port)
{
  QTcpSocket::connectToHost (hostName, port, QTcpSocket::ReadWrite);
}

void
IrcSocket::DisconnectLater (int msecs)
{
  QTimer::singleShot (msecs, this, SLOT (Disconnect()));
}

void
IrcSocket::Disconnect ()
{
  SendData (QString ("QUIT :%1").arg (quitMsg));
  disconnectFromHost ();
}

QString
IrcSocket::Name ()
{
  return objectName();
}

QString
IrcSocket::HostName ()
{
  return hostName;
}

void
IrcSocket::SetHostName (const QString & name)
{
  hostName = name;
  knowHostName = true;
}

void
IrcSocket::DidConnect ()
{
  onTheWayOut = false;
  hostName = peerAddress().toString();
  emit connected (this);
  scriptTimer->start (1000);
  int pingSecs = deliberate::Settings().value("network/pingsecs",35).toInt();
  pingTimer->start(pingSecs*1000);
}

void
IrcSocket::DidDisconnect ()
{
  qDebug() << Q_FUNC_INFO << this;
  onTheWayOut = true;
  emit disconnected (this);
}

void
IrcSocket::Receive ()
{
  QByteArray bytes = readAll ();
qDebug () << __PRETTY_FUNCTION__ << " got " << bytes.size() << " bytes " << bytes;
  numBytesIn += bytes.size();
  QByteArray last2 = lineData.right(2);
  if (last2.size () < 2) {
    last2.prepend ("??");
    last2 = last2.right (2);
  }
  int nb = bytes.size();
  char byte;
  char last0, last1;
  last0 = last2[0];
  last1 = last2[1];
  for (int b=0; b< nb; b++) {
    byte = bytes[b];
    lineData.append (byte);
    last0 = last1;
    last1 = byte;
    if (last0 == '\r' && last1 == '\n') {
      emit ReceivedLine (this, lineData);
      lineData.clear ();
    }
  }
  emit IOActivity ();
}

void
IrcSocket::Send (QString data)
{
  scriptLines += data;
  RollScript ();
}

void
IrcSocket::SendData (const QString & data)
{
  QString copyStr (data);
  copyStr.append ("\r\n");
  QByteArray copy = copyStr.toUtf8();
  qint64 written = write (copy);
  if (written > 0) {
    needPing = false;
  }
qDebug () << " sent " << written << " bytes to socket: " << copy;
}

void
IrcSocket::RollScript ()
{
  if (!scriptTimer->isActive()) {
    SendScriptHead ();
    scriptTimer->start (250);
  }
}

void
IrcSocket::SendScriptHead ()
{
  if (scriptLines.isEmpty()) {
    scriptTimer->stop ();
    return;
  }
  QString line = scriptLines.takeFirst();
  SendData (line);
}

void
IrcSocket::SendPing ()
{
  if (knowHostName) {
    if (needPing) {
      qDebug () << "send ping goes to " << peerAddress();  
      QString msg (QString ("PING %1").arg (hostName));
      SendData (msg);
    }
    needPing = true;
  } else {
    qDebug () << " cannot PING, unknown host name for " << peerAddress();
    qDebug () << "      guess is " << hostName;
  }
}


void 
IrcSocket::SockError (QAbstractSocket::SocketError err)
{
  qDebug() << Q_FUNC_INFO << "\n\t" << hostName << m_port ;
  qDebug () << " socket error " << err;
  qDebug () << " socket error text " << errorString ();
  if (err == QAbstractSocket::RemoteHostClosedError
      && !onTheWayOut) {
    /* unexpected? try to reconnect */
    ReConnect();
  }
}

void
IrcSocket::ReConnect()
{
  qDebug() << Q_FUNC_INFO;
  IrcQmlControl *daddy = qobject_cast<IrcQmlControl*>(parent());
  Reconnector *reco = new Reconnector (daddy,hostName,m_port);

}


} // namespace

