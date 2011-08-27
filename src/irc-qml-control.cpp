#include "irc-qml-control.h"

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

#include "deliberate.h"
#include "dchat-magic.h"
#include "version.h"
#include "irc-abstract-channel.h"
#include "irc-socket.h"
#include "irc-qml-sock-static.h"
#include "irc-ctcp.h"
#include "html-mangle.h"
#include <QSize>
#include "cert-store.h"
#include "irc-qml-channel-group.h"
#include <QDebug>
#include <QTimer>
#include <QHostAddress>
#include <QTimer>
#include <QFont>
#include <QFile>
#include <QMessageBox>
#include <QDeclarativeContext>
#include <QDebug>

using namespace deliberate;

namespace egalite
{

IrcQmlControl::IrcQmlControl (QObject *parent, 
                              QDeclarativeView * view,
                              IrcQmlChannelGroup * channelGroup)
  :QObject (parent),
   dView (view),
   initDone (false),
   qmlObject (0),
   isRunning (false),
   isProbablyPhone (false),
   dockedChannels (channelGroup),
   isConnected (false),
   hidSelf (false),
   knownServers (0),
   activeServers (this),
   channelModel (this),
   nickModel (this),
   selectedServer (0)
{
  knownServers = new KnownServerModel (this);
  dockedChannels->Start ();
  commandXform ["MSG"] = IrcQmlSockStatic::TransformPRIVMSG;
  commandXform ["ME"] = IrcQmlSockStatic::TransformME;
  commandXform ["JOIN"] = IrcQmlSockStatic::TransformJOIN;
  receiveHandler ["PING"] = IrcQmlSockStatic::ReceivePING;
  receiveHandler ["PONG"] = IrcQmlSockStatic::ReceiveIgnore;
  receiveHandler ["PRIVMSG"] = IrcQmlSockStatic::ReceivePRIVMSG;
  receiveHandler ["QUIT"] = IrcQmlSockStatic::ReceiveQUIT;
  receiveHandler ["JOIN"] = IrcQmlSockStatic::ReceiveJOIN;
  receiveHandler ["PART"] = IrcQmlSockStatic::ReceivePART;
  receiveHandler ["004"] = IrcQmlSockStatic::Receive004;
  receiveHandler ["332"] = IrcQmlSockStatic::Receive332;
  receiveHandler ["353"] = IrcQmlSockStatic::Receive353;
  receiveHandler ["366"] = IrcQmlSockStatic::Receive366;
  receiveHandler ["TOPIC"] = IrcQmlSockStatic::ReceiveTOPIC;
  receiveHandler ["VERSION"] = IrcQmlSockStatic::ReceiveIgnore;
  ctcpHandler ["ACTION"] = IrcCtcp::ReceiveACTION;
  ctcpHandler ["VERSION"] = IrcCtcp::ReceiveVERSION;

  connect (&activeServers, SIGNAL (wantDisconnect (IrcSocket*)),
           this, SLOT (DisconnectServer (IrcSocket*)));
  qDebug () << " IrcQmlControl allocated and initialized";
}

void
IrcQmlControl::fillContext (bool assumePhone)
{
  isProbablyPhone = assumePhone;
  QDeclarativeContext * context = dView->rootContext ();
  if (context == 0) {
    return ;
  }
  context->setContextProperty ("cppKnownServerModel", knownServers);
  context->setContextProperty ("cppActiveServerModel", &activeServers);
  context->setContextProperty ("cppChannelListModel",&channelModel);
  context->setContextProperty ("cppNickListModel",&nickModel);
  context->setContextProperty ("isProbablyPhone", assumePhone);
}

bool
IrcQmlControl::Run ()
{
  LoadLists ();
  if (!isRunning) {
    qDebug () << __PRETTY_FUNCTION__ << " Start IrcQmlControl";
  }
  QObject * root = dView->rootObject ();
  QObject *obj  = root->findChild<QObject*>("ControlPanel");
  qmlObject = qobject_cast<QDeclarativeItem*> (obj);
  qDebug () << " control root " << root << " qml object is " 
            << obj << " or " << qmlObject;
  if (qmlObject == 0) {
    return false;
  }
  ConnectGui ();
  fullWidth = dView->size().width();
  fullHeight = dView->size().height();
  ViewStatusChange (dView->status());

  isRunning = true;
  return true;
}

void
IrcQmlControl::ViewStatusChange ( QDeclarativeView::Status status)
{
  qDebug () << __PRETTY_FUNCTION__ << " status change " << status;
  qDebug () << "                 " << qmlObject;
  if (status == QDeclarativeView::Ready && qmlObject) {
    QMetaObject::invokeMethod (qmlObject, "makeVisible");
  }
}

void
IrcQmlControl::LoadLists ()
{
  QStringList  servers = CertStore::IF().IrcServers ();
  noNameServer = tr("--- New Server ---");
  servers.append (noNameServer);
  knownServers->clear ();
  int ns = servers.count();
  for (int i=0; i< ns; i++) {
    knownServers->addServer (servers.at(i), 6667);
  }

  QStringList  nicks = CertStore::IF().IrcNicks ();
  noNameNick = tr (" --- New Nick --- ");
  nicks.append (noNameNick);
  nicks.sort ();
  nickModel.setStringList (nicks);

  QStringList  chans = CertStore::IF().IrcChannels ();
  noNameChannel = tr("# --- New Channel ---");
  rawServer = tr("# --- Raw Server ---");
  chans.append (noNameChannel);
  chans.append (rawServer);
  chans.sort ();
  channelModel.setStringList (chans);

  ignoreSources = CertStore::IF().IrcIgnores ();
}

void
IrcQmlControl::ConnectGui ()
{
  connect (qmlObject, SIGNAL (tryConnect(const QString &, int)),
           this, SLOT (TryConnect (const QString &, int)));
  connect (qmlObject, SIGNAL (selectActiveServer (int)),
           this, SLOT (SetActiveServer (int)));
  connect (qmlObject, SIGNAL (selectChannel (const QString &)),
           this, SLOT (SetCurrentChannel (const QString &)));
  connect (qmlObject, SIGNAL (selectNick (const QString & )),
           this, SLOT (SetCurrentNick (const QString & )));
  connect (qmlObject, SIGNAL (join ()),
           this, SLOT (Join ()));
  connect (qmlObject, SIGNAL (login()),
           this, SLOT (Login ()));
  connect (qmlObject, SIGNAL (wantNewServer (const QString &, int, bool)),
           this, SLOT (ConnectNewServer (const QString &, int, bool)));
  connect (qmlObject, SIGNAL (wantNewChannel (const QString &, bool)),
           this, SLOT (ConnectNewChannel (const QString &, bool)));
  connect (qmlObject, SIGNAL (wantNewUser (const QString &, 
                                           const QString &,
                                           const QString &,
                                                 bool)),
           this, SLOT (ConnectNewUser (const QString &, 
                                       const QString &, 
                                       const QString &,
                                             bool)));
}

void
IrcQmlControl::Exit ()
{
  dockedChannels->Close ();
  TryDisconnect ();
  CloseCleanup ();
}


void
IrcQmlControl::CloseCleanup ()
{
}

void
IrcQmlControl::Exiting ()
{
}

void
IrcQmlControl::ConnectNewServer (const QString & name,
                                 int port,
                                 bool save)
{
  qDebug () << __PRETTY_FUNCTION__ << name << port << save;
  if (save) {
    CertStore::IF().SaveIrcServer (name);
    LoadLists ();
  }
  TryConnect (name, port);  
}

void
IrcQmlControl::ConnectNewChannel (const QString &name, bool save)
{
  qDebug () << __PRETTY_FUNCTION__ << name << save;
  if (save) {
    CertStore::IF().SaveIrcChannel (name);
    LoadLists ();
  }
}

void
IrcQmlControl::ConnectNewUser (const QString & nick,
                               const QString & realName,
                               const QString & pass,
                               bool save)
{
  qDebug () << __PRETTY_FUNCTION__ << nick << realName << pass << save;
  if (save) {
    CertStore::IF().SaveIrcNick (nick, realName, pass);
    LoadLists ();
  }
}

void
IrcQmlControl::TryConnect (const QString & host, int port)
{
  qDebug () << __PRETTY_FUNCTION__ << host << port;
  QString baseHost (host);
  if (baseHost == noNameServer) {
    qDebug () << " missing code to enter a server name";
    QMetaObject::invokeMethod (qmlObject, "askNewServer");
    return;
  }
  qDebug () << " try connect to " << baseHost;
  IrcSocket *socket = new IrcSocket (this);
  sockets [socket->Name()] = socket;
  activeServers.addServer (socket, baseHost, QString (""),
                           QHostAddress(), port);
  connect (socket, SIGNAL (connected (IrcSocket*)),
           this, SLOT (ConnectionReady (IrcSocket*)));
  connect (socket, SIGNAL (disconnected (IrcSocket*)),
           this, SLOT (ConnectionGone (IrcSocket*)));
  connect (socket, SIGNAL (ReceivedLine (IrcSocket*, QByteArray)),
           this, SLOT (ReceiveLine (IrcSocket *, QByteArray)));
  connect (socket, SIGNAL (ChangedHostName (IrcSocket*, QString)),
           this, SLOT (ChangedHostName (IrcSocket*, QString)));
  socket->connectToHost (baseHost, port);
}

void
IrcQmlControl::DisconnectServer (IrcSocket * sock)
{
  qDebug () << "IrcQmlCOntrol:: DisconnectServer " << sock;
  qDebug () << "     sname " << sock->Name();
  PartAll (sock->Name());
  if (sockets.contains (sock->Name())) {
    sockets.remove (sock->Name());
  }
  if (sock) {
    sock->DisconnectLater (3000);
  }
}


void
IrcQmlControl::TryPart ()
{
  QString chan = 0; //mainUi.chanCombo->currentText ();
  IrcSocket * sock = 0; //CurrentSock (mainUi.serverTable);
  if (sock) {
    sock->Send (QString ("PART %1").arg (chan));
  }
}

int
IrcQmlControl::OpenCount ()
{
  return sockets.size();
}

void
IrcQmlControl::TryDisconnect ()
{
  ChannelMapType::iterator  cit;
  for (cit=channels.begin(); cit != channels.end(); cit++) {
    (*cit)->Part();
  }
  SocketMapType::iterator  sit;
  for (sit = sockets.begin (); sit != sockets.end(); sit++) {
    if (*sit) {
      (*sit)->Disconnect ();
    }
  }
}

void
IrcQmlControl::ReceiveLine (IrcSocket * sock, QByteArray line)
{
  QString data (QString::fromUtf8(line.data()));
  qDebug () << __PRETTY_FUNCTION__ ;
  qDebug () << " received Line " << data;
  qDebug () << "       from " << sock->Name();
  if (data.startsWith(QChar (':'))) {
    QRegExp wordRx ("(\\S+)");
    QString first, cmd, rest;
    int pos, len;
    int totallen (data.length());
    int restlen (totallen);
    pos = wordRx.indexIn (data,1);
    if (pos >= 0) {
      len = wordRx.matchedLength ();
      restlen = totallen - (pos + len);
      first = data.mid (pos,len);
      pos = wordRx.indexIn (data,pos+len+1);
      if (pos >= 0) {
        len = wordRx.matchedLength ();
        restlen = totallen - (pos+len);
        cmd = data.mid (pos,len).toUpper();
      }
    }
    rest = data.right (restlen);
    cmd = cmd.trimmed ();
    QRegExp numericRx ("\\d\\d\\d");
    qDebug () << __PRETTY_FUNCTION__ << " cmd " << cmd;
    if (receiveHandler.contains (cmd.toUpper())) {
      qDebug () << "                 " << " have handler ";
      (*receiveHandler [cmd]) (this, sock, first, cmd, rest);
    } else if (numericRx.exactMatch (cmd)) {
      qDebug () << "                 " << " numeric ";
      IrcQmlSockStatic::ReceiveNumeric (this, sock, first, cmd, rest);
    } else {
      qDebug () << "                 " << " default ";
      IrcQmlSockStatic::ReceiveDefault (this, sock, first, cmd, rest);
    }
    ReceiveRaw (sock, line);
  } else {
    if (data.startsWith ("PING")) {
      QString retName = data.split (QRegExp("(\\s+)")).at(1);
      sock->Send (QString ("PONG :%1").arg(retName));
    }
    ReceiveRaw (sock, line);
  }
  qDebug () << " Received line " << line;
  //mainUi.logDisplay->append (QString (line));
}

void
IrcQmlControl::ReceiveRaw (IrcSocket * sock, const QByteArray & line)
{
  qDebug () << " IrcQmlControl::ReceiveRaw " << sock
            << sock->HostName() << line;
  ChannelMapType::iterator cit;
  for (cit=channels.begin(); cit != channels.end(); cit++) {
    if (cit.value()->Raw() && cit.value()->Sock() == sock->Name()) {
      cit.value()->Incoming (QString (line), QString (line));
    }
  }
}

void
IrcQmlControl::Send ()
{
#if 0
  int row = 0; //mainUi.serverTable->currentRow ();
  QTableWidgetItem * item = 0; //FindType (mainUi.serverTable, row, int (Cell_Addr));
  if (item) {
    QString sname = item->data (int(Data_ConnName)).toString();
    if (sockets.contains (sname)) {
      QString text ; //= mainUi.sendEdit->text ();
      IrcSocket * sock = sockets [sname];
      TransformSend (sock, "", text);
      sock->Send (text);
    }
  }
#endif
}

void
IrcQmlControl::TransformSend (IrcSocket * sock, const QString & chan,
                              QString & data)
{
  if (data.startsWith(QChar ('/'))) {
    QRegExp wordRx ("(\\S+)");
    int pos = wordRx.indexIn (data, 1);
    if (pos >= 0) {
      int len = wordRx.matchedLength ();
      QString first = data.mid (1,len).toUpper();
      QString rest = data.mid (len+1,-1);
      QString copyChan (chan);
      if (commandXform.contains (first)) {
        (*commandXform[first]) (this, sock, data, copyChan, first, rest);
      } else {
        IrcQmlSockStatic::TransformDefault (this, sock, data, copyChan, first, rest);
      }
    }
  }
}


void
IrcQmlControl::ConnectionReady (IrcSocket * sock)
{
  qDebug () << " connection ready " << sock->peerAddress().toString();
  AddConnect (sock);
  emit StatusChange ();
}

void
IrcQmlControl::AddConnect (IrcSocket *sock)
{
  if (sock == 0) {
    return;
  }
  activeServers.setAddress (sock, sock->peerAddress());
  activeServers.setPort (sock, sock->peerPort());
}

void
IrcQmlControl::ChangedHostName (IrcSocket * sock, QString name)
{
  qDebug () << " have new host name " << name << " for " << sock;
  if (sock == 0) {
    return;
  }
  activeServers.setRealName (sock, name);
  QString sname = sock->Name();
  ChannelMapType::iterator cit;
  for (cit=channels.begin(); cit!=channels.end(); cit++) {
    if (*cit) {
      if ((*cit)->Sock() == sname) {
        (*cit)->SetHost (name);
      }
    }
  }
}

void
IrcQmlControl::ConnectionGone (IrcSocket * sock)
{
  qDebug () << " disconnect seen from " << sock;
  if (sock == 0) {
    return;
  }
  activeServers.removeServer (sock);
  QString sockName (sock->Name());
  sockets.remove (sock->Name());

  ChannelMapType::iterator cit;
  for (cit=channels.begin(); cit != channels.end(); cit++) {
    if (*cit) {
      IrcAbstractChannel * chan = *cit;
qDebug () << " Check Disconnect chan " << chan->Sock() << chan->Name()
          << " at key " << cit.key();
      if (chan->Sock() == sockName) {
        DropChannel (sock, chan->Name());
      }
    }
  }

  if (selectedServer == sock) {
    activeServers.selectNone ();
    selectedServer = 0;
  }
  sock->deleteLater ();
  emit StatusChange ();
}


void
IrcQmlControl::NickLogin (const QString & nick, IrcSocket *sock)
{
  if (sock == 0) {
    return;
  }
  QString useNick (nick);
  if (useNick == noNameNick) {
    QMetaObject::invokeMethod (qmlObject,"askNewUser");
    return;
  }
  QString pass;
  QString real;
  bool  havePass = CertStore::IF().GetIrcIdent (useNick, real, pass);
  if (real.length() == 0) {
    real = useNick;
  }
  if (havePass) {
    sock->Send (QString ("PASS :%1").arg(pass));
  }
  sock->Send (QString ("USER %1 0 * :%2").arg (useNick).arg(real));
  sock->Send (QString ("NICK %1").arg (useNick));
  sock->SetNick (useNick);
  QString part;
  QString quit;
  bool haveMsgs = CertStore::IF().GetIrcMessages (useNick, part, quit);
  if (haveMsgs) {
    sock->SetPartMsg (part);
    sock->SetQuitMsg (quit);
  }
}

void
IrcQmlControl::AddChannel (IrcSocket * sock, 
                           const QString & chanName, 
                           bool isRaw)
{
  qDebug () << __PRETTY_FUNCTION__ << sock << chanName << isRaw;
  if (channels.contains (chanName)) {
    return;
  }
  if (sock == 0) {
    return;
  }
  IrcAbstractChannel * newchan  = 
        new IrcAbstractChannel (chanName, sock->Name(), this);
  channels [chanName] = newchan;
  dockedChannels->AddChannel (newchan);
  newchan->SetHost (sock->HostName());
  newchan->SetPartMsg (sock->PartMsg ());
  newchan->SetRaw (isRaw);
  if (!isRaw) {
    newchan->StartWatching 
      (QRegExp (QString ("\\b%1\\b").arg(sock->Nick())));
    connect (newchan, SIGNAL (WatchAlert (QString, QString)),
           this, SLOT (SeenWatchAlert (QString, QString)));
  }
  connect (newchan, SIGNAL (Outgoing (QString, QString)),
           this, SLOT (Outgoing (QString, QString)));
  connect (newchan, SIGNAL (OutRaw (QString, QString)),
           this, SLOT (SendRaw (QString, QString )));
  connect (newchan, SIGNAL (Active (IrcAbstractChannel *)),
           this, SLOT (ChanActive (IrcAbstractChannel *)));
  connect (newchan, SIGNAL (InUse (IrcAbstractChannel *)),
           this, SLOT (ChanInUse (IrcAbstractChannel *)));
  connect (newchan, SIGNAL (WantFloat (IrcAbstractChannel *)),
           this, SLOT (ChanWantsFloat (IrcAbstractChannel *)));
  connect (newchan, SIGNAL (WantDock (IrcAbstractChannel *)),
           this, SLOT (ChanWantsDock (IrcAbstractChannel *)));
  connect (newchan, SIGNAL (WantClose (IrcAbstractChannel *)),
           this, SLOT (ChanWantsClose (IrcAbstractChannel *)));
  connect (newchan, SIGNAL (HideChannel (IrcAbstractChannel *)),
           this, SLOT (HideChannel (IrcAbstractChannel *)));
  connect (newchan, SIGNAL (ToggleFloat (IrcAbstractChannel *)),
           this, SLOT (WantsFloatToggle (IrcAbstractChannel *)));
  connect (newchan, SIGNAL (WantWhois (QString, QString, bool)),
           this, SLOT (WantsWhois (QString, QString, bool)));
  connect (newchan, SIGNAL (ShowControl()),
           this, SLOT (ShowControl()));
  EmitAddedChannel ();
}

void
IrcQmlControl::EmitAddedChannel ()
{
  qDebug () << __PRETTY_FUNCTION__ <<  " to " << qmlObject;
  if (qmlObject) {
    QMetaObject::invokeMethod (qmlObject,"channelAdded");
  }
}

void
IrcQmlControl::DropChannel (IrcSocket * sock, const QString & chanName)
{
  Q_UNUSED (sock)
  if (!channels.contains (chanName)) {
qDebug () << " DropChannel doesn't have " << chanName;
    return;
  }

  IrcAbstractChannel * chanBox = channels [chanName];
  disconnect (chanBox, 0,0,0);
  qDebug () << " dropping channel " << chanName << chanBox->Name();
  chanBox->SetQmlItem (0);
  if (dockedChannels->HaveChannel (chanBox)) {
    dockedChannels->RemoveChannel (chanBox);
  }
  if (floatingChannels.contains (chanBox)) {
    IrcFloat * oldFloat = floatingChannels [chanBox];
    oldFloat->RemoveChannel (chanBox);
    floatingChannels.remove (chanBox);
    oldFloat->deleteLater ();
  }
  channels.remove (chanName);
  chanBox->deleteLater ();
}

void
IrcQmlControl::WantsWhois (QString channel, QString otherUser, bool wantsit)
{
  if (wantsit) {
    whoisWait [otherUser] = channel;
  } else {
    whoisWait.remove (otherUser);
  }
}

void
IrcQmlControl::WhoisData (const QString & thisUser,
                          const QString & otherUser,
                          const QString & numeric,
                          const QString & data)
{
  if (whoisWait.contains (otherUser)) {
    QString chan = whoisWait[otherUser];
    if (channels.contains (chan)) {
      IrcAbstractChannel * box = channels[chan];
      box->WhoisData (otherUser, numeric, data);
    }
  }
}

void
IrcQmlControl::ShowChannel (IrcAbstractChannel * chanBox)
{
  if (dockedChannels->HaveChannel (chanBox)) {
    dockedChannels->ShowChannel (chanBox);
  } else if (floatingChannels.contains (chanBox)) {
    floatingChannels [chanBox]->Show ();
  }
}

void
IrcQmlControl::HideChannel (IrcAbstractChannel * chanBox)
{
  if (floatingChannels.contains (chanBox)) {
    floatingChannels [chanBox]->Hide();
  }
}

void
IrcQmlControl::ShowControl ()
{
  if (qmlObject) {
    QMetaObject::invokeMethod (qmlObject,"showControl");
  }
}

void
IrcQmlControl::PartAll (const QString & sockName)
{
  ChannelMapType::iterator cit;
  for (cit=channels.begin(); cit != channels.end(); cit++) {
    if (*cit) {
      IrcAbstractChannel * chan = *cit;
      if (chan->Sock() == sockName) {
        chan->Part ();
      }
    }
  }
}

void
IrcQmlControl::UserQuit (IrcSocket * sock,
                         const QString & user,
                         const QString & msg)
{
  QString sockName = sock->Name();
  QString quitMsg = QString (tr("QUIT ") + msg);
  ChannelMapType::iterator cit;
  for (cit=channels.begin(); cit != channels.end(); cit++) {
    if (*cit) {
      IrcAbstractChannel * chan = *cit;
      if (chan->Sock() == sockName) {
        chan->DropName (user, quitMsg);
      }
    }
  }
}

void
IrcQmlControl::ChanActive (IrcAbstractChannel *chan)
{
  dockedChannels->MarkActive (chan, true);
}

void
IrcQmlControl::ChanInUse (IrcAbstractChannel *chan)
{
  dockedChannels->MarkActive (chan, false);
}

void
IrcQmlControl::ChanWantsFloat (IrcAbstractChannel *chan)
{
  qDebug () << __PRETTY_FUNCTION__ << chan;
  if (dockedChannels->HaveChannel (chan)) {
    dockedChannels->RemoveChannel (chan);
  }
  if (!floatingChannels.contains (chan)) {
    IrcFloat * newFloat = new IrcFloat (0);
    floatingChannels [chan] = newFloat;
    newFloat->AddChannel (chan);
    newFloat->show ();
  }
}

void
IrcQmlControl::ChanWantsDock (IrcAbstractChannel *chan)
{
  qDebug () << __PRETTY_FUNCTION__ << chan;
  if (floatingChannels.contains (chan)) {
    IrcFloat * oldFloat = floatingChannels [chan];
    oldFloat->RemoveChannel (chan);
    floatingChannels.remove (chan);
    oldFloat->deleteLater ();
  }
  if (!dockedChannels->HaveChannel (chan)) {
    dockedChannels->AddChannel (chan);
  }
}

void
IrcQmlControl::WantsFloatToggle (IrcAbstractChannel *chan)
{
  if (floatingChannels.contains (chan)) {
    ChanWantsDock (chan);
  } else if (dockedChannels->HaveChannel (chan)) {
    ChanWantsFloat (chan);
  }
}

void
IrcQmlControl::ChanWantsClose (IrcAbstractChannel *chan)
{
  if (chan) {
    if (sockets.contains (chan->Sock())) {
      IrcSocket * sock = sockets[chan->Sock()];
      if (sock) {
        DropChannel (sock, chan->Name());
      }
    }
  }
}

void
IrcQmlControl::SeenWatchAlert (QString chanName, QString data)
{
  emit WatchAlert (tr ("IRC (%2): %1").arg(data).arg(chanName));
}

void
IrcQmlControl::Outgoing (QString chan, QString msg)
{
  QString trim = msg.trimmed ();
  if (trim.length () < 1) {
    return;
  }
  if (!channels.contains (chan)) {
    return;
  }
  QString sname = channels[chan]->Sock ();
  if (!sockets.contains (sname)) {
    return;
  }
  IrcSocket * sock = sockets [sname];
  if (trim.startsWith (QChar ('/')) ) {
    QString cooked (trim);
    TransformSend (sock, chan, cooked);
    sock->Send (cooked);
    qDebug () << " ==========> handed to socket: " << cooked;
    trim.prepend (QString (":%1!%1@localhost ").arg (sock->Nick()));
    ReceiveLine (sock, trim.toUtf8());
  } else {
    QString data (QString ("PRIVMSG %1 :%2").arg (chan). arg (msg));
    sock->SendData (data);
    data.prepend (QString (":%1!%1@localhost ").arg (sock->Nick()));
    ReceiveLine (sock, data.toUtf8());
  }
}

void
IrcQmlControl::InChanMsg (IrcSocket * sock,
                          const QString & chan,
                          const QString & from,
                          const QString & msg)
{
  if (ignoreSources.contains (from)) {
    return;
  }
  if (channels.contains (chan)) {
    QString themsg = msg.trimmed();
    if (themsg.startsWith (QChar (':'))) {
      themsg.remove (0,1);
    }
    if (themsg.startsWith (QChar (1))) {
      IncomingCtcpChan (sock, from, chan, themsg);
    } else {
      channels [chan]->Incoming (QString ("<a href=\"ircsender://%1@egalite\">%1</a>: %2")
                                 .arg(from)
                                 .arg(HtmlMangle::Sanitize(themsg)),
                                 themsg);
    }
  }
}


void
IrcQmlControl::InUserMsg (IrcSocket * sock,
                          const QString & from,
                          const QString & to,
                          const QString & msg)
{
  if (ignoreSources.contains (from)) {
    return;
  }
  QString themsg = msg.trimmed();
  if (themsg.startsWith (QChar (':'))) {
    themsg.remove (0,1);
  }
  if (themsg.startsWith (QChar (1))) {
    IncomingCtcpUser (sock, from, to, themsg);
  } else {
    IncomingRaw (sock, from, QString ("<a href=\"ircsender://%1@egalite\">%1</a>: %2").
                 arg(from).arg(themsg));
  }
#if 0
  mainUi.logDisplay->append (QString ("Message from %1 to %2 says %3")
                             .arg (from)
                             .arg (to)
                             .arg (msg));
#endif
}

void
IrcQmlControl::IncomingRaw (IrcSocket * sock,
                            const QString & from,
                            const QString & msg)
{
  if (!channels.contains (from)) {
    AddChannel (sock, from);
  }
  channels [from]->Incoming (msg);
}

void
IrcQmlControl::SendRaw (QString sockName, QString data)
{
  if (sockets.contains (sockName)) {
    sockets [sockName] -> Send (data);
  }
}

void
IrcQmlControl::IncomingCtcpChan (IrcSocket * sock,
                                 const QString & from,
                                 const QString & chan,
                                 const QString & msg)
{
  QString themsg (msg);
  themsg.chop (1);
  themsg.remove (0,1);
  QRegExp cmdRx ("(\\S+)");
  int pos, len;
  qDebug () << " Ctcp CHAN " << msg;
  pos = cmdRx.indexIn (themsg, 0);
  if (pos >=0 ) {
    len = cmdRx.matchedLength ();
    QString cmd = themsg.mid (pos,len);
    if (ctcpHandler.contains (cmd)) {
      (*ctcpHandler [cmd]) (this, sock, from, chan, themsg.mid (pos+len,-1));
      return;
    }
  }
  channels [chan]->Incoming (QString
                             ("<a href=\"ircsender://%1\">%1</a>:"
                              "<span style=\"font-size:small\">CTCPc</span> %2").
                             arg(from).arg(HtmlMangle::Sanitize(msg)),
                             msg);
}


void
IrcQmlControl::IncomingCtcpUser (IrcSocket * sock,
                                 const QString & from,
                                 const QString & to,
                                 const QString & msg)
{
  QString themsg (msg);
  themsg.chop (1);
  themsg.remove (0,1);
  QRegExp cmdRx ("(\\S+)");
  int pos, len;
  pos = cmdRx.indexIn (themsg, 0);
  qDebug () << " Ctcp USER " << msg;
  if (pos >=0 ) {
    len = cmdRx.matchedLength ();
    QString cmd = themsg.mid (pos,len);
    if (ctcpHandler.contains (cmd)) {
      (*ctcpHandler [cmd]) (this, sock, from, from, themsg.mid (pos+len,-1));
      return;
    }
  }
  if (channels.contains (from)) {
    channels [from]->Incoming (QString
                               ("<a href=\"ircsender://%1\">%1</a>:"
                                "<span style=\"font-size:small\">CTCPu</span> %2")
                               .arg(from).arg(HtmlMangle::Sanitize(msg)),
                               msg);
  }
}

void
IrcQmlControl::LogRaw (const QString & raw)
{
// mainUi.logDisplay->append (raw);
  qDebug () << "IrcQmlControl :: LogRaw " << raw;
}

void
IrcQmlControl::AddNames (const QString & chanName, const QString & names)
{
  if (!channels.contains (chanName)) {
    return;
  }
  IrcAbstractChannel * chan = channels [chanName];
  chan->AddNames (names);
}

void
IrcQmlControl::AddName (const QString & chanName, const QString & name)
{
  if (!channels.contains (chanName)) {
    return;
  }
  IrcAbstractChannel * chan = channels [chanName];
  chan->AddName (name);
}

void
IrcQmlControl::DropName (IrcSocket * sock,
                         const QString & chanName,
                         const QString & name,
                         const QString & msg)
{
  if (!channels.contains (chanName)) {
    return;
  }
  IrcAbstractChannel * chan = channels [chanName];
  chan->DropName (name, msg);
}

void
IrcQmlControl::SetTopic (IrcSocket * sock,
                         const QString & chanName, const QString & topic)
{
  if (!channels.contains (chanName)) {
    return;
  }
  IrcAbstractChannel * chan = channels [chanName];
  chan->SetTopic (topic);
}

void
IrcQmlControl::EditServers ()
{
#if 0
  EditSimple  edit (tr("IRC Servers"), this);
  edit.SetFuncs (SaveServer, RemoveServer, LoadServers);
  edit.Exec ();
  #endif
}

void
IrcQmlControl::EditChannels ()
{
#if 0
  EditSimple  edit (tr("IRC Channels"), this);
  edit.SetFuncs (SaveChannel, RemoveChannel, LoadChannels);
  edit.Exec ();
  #endif
}

void
IrcQmlControl::EditIgnores ()
{
#if 0
  EditSimple  edit (tr("IRC Ignores"), this);
  edit.SetFuncs (SaveIgnore, RemoveIgnore, LoadIgnores);
  edit.Exec ();
  #endif
}

void
IrcQmlControl::SaveServer (const QString & name)
{
  CertStore::IF().SaveIrcServer (name);
}

void
IrcQmlControl::SaveChannel (const QString & name)
{
  CertStore::IF().SaveIrcChannel (name);
}

void
IrcQmlControl::SaveIgnore (const QString & name)
{
  CertStore::IF().SaveIrcIgnore (name);
}

void
IrcQmlControl::RemoveServer (const QString & name)
{
  CertStore::IF().RemoveIrcServer (name);
}

void
IrcQmlControl::RemoveChannel (const QString & name)
{
  CertStore::IF().RemoveIrcChannel (name);
}

void
IrcQmlControl::RemoveIgnore (const QString & name)
{
  CertStore::IF().RemoveIrcIgnore (name);
}

QStringList
IrcQmlControl::LoadServers ()
{
  return CertStore::IF().IrcServers ();
}

QStringList
IrcQmlControl::LoadChannels ()
{
  return CertStore::IF().IrcChannels ();
}

QStringList
IrcQmlControl::LoadIgnores ()
{
  return CertStore::IF().IrcIgnores ();
}

void
IrcQmlControl::SetActiveServer (int row)
{
  selectedServer = activeServers.socket (row);
}

void
IrcQmlControl::SetCurrentChannel (const QString & chan)
{
  selectedChannel = chan;
}

void
IrcQmlControl::SetCurrentNick (const QString & nick)
{
  selectedNick = nick;
}

void
IrcQmlControl::Join ()
{
  qDebug () << __PRETTY_FUNCTION__ << selectedChannel << selectedServer;
  if (selectedServer) {
    if (selectedChannel == rawServer) {
      qDebug () << "IrcQmlControl:: Join " << selectedServer->HostName();
      AddChannel (selectedServer, selectedServer->HostName(), true);
    } else {
      if (selectedChannel == noNameChannel) {
        QMetaObject::invokeMethod (qmlObject,"askNewChannel");
        return;
      }
      selectedServer->Send (QString ("JOIN %1").arg(selectedChannel));
    }
  }
}

void
IrcQmlControl::Login ()
{
  qDebug () << " IrcQmlControl Login " << selectedNick << selectedServer;
  NickLogin (selectedNick, selectedServer);
}


#if EGALITE_IRC_CONTROL_RESIZE
void
IrcQmlControl::resizeEvent (QResizeEvent * event)
{
  if (event) {
    Resize (event->size().width(), event->size().height());
  }   
  QDeclarativeView::resizeEvent (event); 
}

#endif

void
IrcQmlControl::Resize (qreal width, qreal height)
{
  if (qmlObject) {
    qmlObject->setProperty ("width",width);
    qmlObject->setProperty ("height",height);
  }
}

} // namespace

