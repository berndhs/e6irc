#include "irc-qml-sock-static.h"

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

#include "irc-qml-control.h"
#include "irc-socket.h"
#include <QRegExp>
#include <QString>

namespace egalite
{

void
IrcQmlSockStatic::TransformDefault (IrcQmlControl * context, IrcSocket *sock,
                           QString & result, QString & chan, 
                           QString & first, 
                           QString & rest)
{
  Q_UNUSED (context)
  result = first + rest;
}

void
IrcQmlSockStatic::TransformPRIVMSG (IrcQmlControl * context, IrcSocket *sock,
                           QString & result, QString & chan, 
                           QString & first, 
                           QString & rest)
{
  Q_UNUSED (context)
  Q_UNUSED (chan)
  first = "PRIVMSG";
  QRegExp wordRx ("(\\S+)");
  int pos = wordRx.indexIn (rest, 0);
  if (pos >= 0) {
    int len = wordRx.matchedLength ();
    rest.insert (pos + len, " :");
  }
  result = first + " " + rest;
qDebug () << " PRIVMSG result " << result;
}

void
IrcQmlSockStatic::TransformME (IrcQmlControl * context, IrcSocket *sock,
                           QString & result, QString & chan, 
                           QString & first, 
                           QString & rest)
{
  Q_UNUSED (context)
qDebug () << "ME data " << result << chan << first << rest;
  first = "PRIVMSG";
  rest.prepend (QString (" %1 :\001ACTION ").arg(chan));
  rest.append ("\001");
  result = first + " " + rest;
qDebug () << " PRIVMSG ME result " << result;
}

void 
IrcQmlSockStatic::TransformJOIN (IrcQmlControl * context, IrcSocket *sock,
                        QString & result, QString & chan,
                        QString & first,
                        QString & rest)
{
  result = first + rest;
}

void
IrcQmlSockStatic::ReceivePING (IrcQmlControl * context, IrcSocket *sock,
                      const QString & first,
                      const QString & cmd,
                      const QString & rest)
{
  Q_UNUSED (cmd)
  Q_UNUSED (rest)
qDebug () << " answring PING from " << first;
  QString answer = QString ("PONG %1 %2").arg(first).arg(rest);
  sock->SendData (answer);
}

void
IrcQmlSockStatic::ReceiveJOIN (IrcQmlControl * context, IrcSocket *sock,
                      const QString & first,
                      const QString & cmd,
                      const QString & rest)
{
  Q_UNUSED (cmd)
  QRegExp wordRx ("(\\S+)");
  int pos, len;
  QString user, chan;
  pos = wordRx.indexIn (first, 0);
  if (pos >= 0) {
    len = wordRx.matchedLength ();
    user = first.mid (pos,len);
    QRegExp leadRx ("([^!]+)");
    pos = leadRx.indexIn (user,0);
    if (pos >= 0) {
      user = user.mid (pos, leadRx.matchedLength());
    }
    if (user.startsWith (QChar (':'))) {
      user.remove (0,1);
    }
  }
  pos = wordRx.indexIn (rest,0);
  if (pos >= 0) {
    len = wordRx.matchedLength ();
    chan = rest.mid (pos,len);
qDebug () << " JOIN received,  " << first << cmd << rest;
qDebug () << "user " << user << " sock user " 
          << sock->Nick() << " chan " << chan;
    if (chan.startsWith (QChar(':'))) {
      chan.remove (0,1);
    }
    if (user == sock->Nick()) {
      if (!context->channels.contains (chan)) {
        context->AddChannel (sock, chan);
      }
    } else {
      context->AddName (chan, user);
#if 0
      context->mainUi.logDisplay->append (QString ("user %1 JOINs %2")
                                    .arg (user) . arg (chan));
#endif
    }
  }
}

void
IrcQmlSockStatic::ReceivePART (IrcQmlControl * context, IrcSocket *sock,
                     const QString & first,
                     const QString & cmd,
                     const QString & rest)
{
  qDebug () << " PART received " << first << cmd << rest;
  QRegExp wordRx ("(\\S+)");
  int pos, len;
  QString user, chan;
  pos = wordRx.indexIn (first, 0);
  if (pos >= 0) {
    len = wordRx.matchedLength ();
    user = first.mid (pos,len);
    QRegExp leadRx ("([^!]+)");
    pos = leadRx.indexIn (user,0);
    if (pos >= 0) {
      user = user.mid (pos, leadRx.matchedLength());
    }
    if (user.startsWith (QChar (':'))) {
      user.remove (0,1);
    }
  }
  pos = wordRx.indexIn (rest,0);
  if (pos >= 0) {
    len = wordRx.matchedLength ();
    chan = rest.mid (pos,len);
    if (chan.startsWith (QChar (':'))) {
      chan.remove (0,1);
    }
qDebug () << " PART received for channel " << chan;
qDebug () << "user " << user << " currentUser " 
          << sock->Nick() << " chan " << chan;
    if (user == sock->Nick()) {
      context->DropChannel (sock, chan);
    } else {
      context->DropName (sock, chan, user, rest.mid (pos+len,-1));
#if 0
      context->mainUi.logDisplay->append 
                             (QString ("user %1 PARTs %2 saying %3")
                               .arg (user) . arg (chan)
                               .arg (rest.mid (pos+len,-1)));
#endif
    }
  }
}

void
IrcQmlSockStatic::ReceivePRIVMSG (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest)
{
  int pos, len;
  QRegExp sourceRx ("(\\S+)!");
  QString source (first);
  QString dest;
  QString msg;
  QRegExp wordRx ("(\\S+)");
  pos = sourceRx.indexIn (first,0);
  if (pos >= 0) {
    len = sourceRx.matchedLength ();
    source = first.mid (pos,len);
    source.chop (1);
    if (source.startsWith (QChar (':'))) {
      source.remove (0,1);
    }
  }
  pos = wordRx.indexIn (rest,0);
  if (pos >= 0) {
    len = wordRx.matchedLength ();
    dest = rest.mid (pos,len);
    msg = rest.mid (pos+len,-1);
    if (context->channels.contains (dest)) {
      context->InChanMsg (sock, dest, source, msg);
    } else {
      context->InUserMsg (sock, source, dest, msg);
    }
  }
}

void
IrcQmlSockStatic::ReceiveQUIT (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest)
{
  Q_UNUSED (cmd)
  int pos, len;
  QRegExp sourceRx ("(\\S+)!");
  QString user (first);
  QString dest;
  QString msg;
  QRegExp wordRx ("(\\S+)");
  pos = sourceRx.indexIn (first,0);
  if (pos >= 0) {
    len = sourceRx.matchedLength ();
    user = first.mid (pos,len);
    user.chop (1);
    if (user.startsWith (QChar (':'))) {
      user.remove (0,1);
    }
    context->UserQuit (sock, user, rest);
  }
}

void
IrcQmlSockStatic::ReceiveTOPIC (IrcQmlControl * context, IrcSocket *sock,
                       const QString & first,
                       const QString & cmd,
                       const QString & rest)
{
  Q_UNUSED (cmd)
  int pos, len;
  QRegExp wordRx ("(\\S+)");
  pos = wordRx.indexIn (rest,0);
  if (pos >= 0) {
    len = wordRx.matchedLength ();
    QString chanName = rest.mid (pos,len);
    QString topic = rest.mid (pos+len).trimmed ();
    if (topic.startsWith (QChar (':'))) {
      topic.remove (0,1);
    }
    context->SetTopic (sock, chanName, topic);
  }
}

void
IrcQmlSockStatic::ReceiveNumeric (IrcQmlControl * context, IrcSocket *sock,
                        const QString & first,
                        const QString & num,
                        const QString & rest)
{
  context->LogRaw (QString ("numeric %1  %2 %3").arg(first).arg(num).arg(rest));
  if (num == "311" || num == "312" || num == "313" 
      || num == "319" || num == "401") {
    QString theRest (rest);
    QString thisUser, otherUser;
    QRegExp wordRx ("(\\S+)");
    bool haveThis = Chomp (wordRx, thisUser, theRest);
    if (haveThis) {
      bool haveOther = Chomp (wordRx, otherUser, theRest);
      if (haveOther) {
        while (theRest.endsWith (QChar('\n')) 
            || theRest.endsWith (QChar('\r'))) {
          theRest.chop (1);
        }
        context->WhoisData (thisUser, otherUser, num, theRest);
      }
    }
  }
}

void
IrcQmlSockStatic::ReceiveDefault (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest)
{
  qDebug () << "Default Receiver " << context << first << cmd << rest;
  context->LogRaw (QString ("%1 %2 %3").arg(first).arg (cmd). arg(rest));
}

void
IrcQmlSockStatic::ReceiveIgnore (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest)
{
  Q_UNUSED (context)
  Q_UNUSED (sock)
  Q_UNUSED (first)
  Q_UNUSED (cmd)
  Q_UNUSED (rest)
  qDebug () << " Ignoring command " << cmd;
}

void
IrcQmlSockStatic::Receive004 (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest)
{
  Q_UNUSED (cmd)
  Q_UNUSED (first)
  QRegExp wordRx ("(\\S+)");
  int pos, len;
  pos = wordRx.indexIn (rest,0);
  if (pos >= 0) {
    len = wordRx.matchedLength ();
    QString dest = rest.mid (pos, len);
    pos = wordRx.indexIn (rest, pos+len);
    if (pos >= 0) {
      len = wordRx.matchedLength ();
      QString host = rest.mid (pos, len);
      context->ChangedHostName (sock, host);
      sock->SetHostName (host);
    }
  }
}

void
IrcQmlSockStatic::Receive332 (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest)
{
  qDebug () << " Received 332 " << first << cmd << rest;
  QRegExp wordRx ("(\\S+)");
  int pos, len;
  QString user, chan, topic;
  pos = wordRx.indexIn (rest, 0);
  if (pos >= 0) {
    len = wordRx.matchedLength();
    user = rest.mid (pos, len);
    pos = wordRx.indexIn (rest, pos+len);
    if (pos >= 0) {
      len = wordRx.matchedLength ();
      chan = rest.mid (pos, len);
      topic = rest.mid (pos+len, -1).trimmed ();
      if (topic.startsWith (QChar (':'))) {
        topic.remove (0,1);
      }
      context->SetTopic (sock, chan, topic);
    }
  }
}

void
IrcQmlSockStatic::Receive353 (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest)
{
  qDebug () << " Received 353 " << first << cmd << rest;
  QRegExp wordRx ("(\\S+)");
  int pos, len;
  QString user, marker, chan;
  pos = wordRx.indexIn (rest, 0);
  if (pos >= 0) {
    len = wordRx.matchedLength();
    user = rest.mid (pos, len);
    pos = wordRx.indexIn (rest, pos+len);
    if (pos >= 0) {
      len = wordRx.matchedLength ();
      marker = rest.mid (pos, len);
      pos = wordRx.indexIn (rest, pos+len);
      if (pos >= 0) {
        len = wordRx.matchedLength ();
        chan = rest.mid (pos,len);
        QString nameData = rest.mid (pos+len,-1).trimmed ();
        if (nameData.startsWith (QChar(':'))) {
          nameData.remove (0,1);
        }
        context->AddNames (chan, nameData);
      }
    }
  }
}


void
IrcQmlSockStatic::Receive366 (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest)
{
  qDebug () << " Received 366 " << first << cmd << rest;
}

bool
IrcQmlSockStatic::Chomp (QRegExp & pattern, QString & result, QString & data)
{
  int pos, len;
  pos = pattern.indexIn (data);
  if (pos < 0) {
    result = "";
    return false;
  } else {
    len = pattern.matchedLength ();
    result = data.mid (pos,len);
    data.remove (0,pos+len);
    return true;
  }
}

} // namespace
