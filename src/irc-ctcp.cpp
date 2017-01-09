
#include "irc-ctcp.h"

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

#include <QString>
#include "irc-socket.h"
#include "irc-qml-control.h"
#include "version.h"

namespace egalite
{

void
IrcCtcp::ReceiveACTION(IrcQmlControl * context, IrcSocket * sock,
                              const QString & from,
                              const QString & dest,
                              const QString & msg)
{
  context->IncomingRaw (sock, dest, QString ("%1 %2")
                   .arg (from)
                   .arg (msg));
}

void
IrcCtcp::ReceiveVERSION (IrcQmlControl * context, IrcSocket * sock,
                              const QString & from,
                              const QString & dest,
                              const QString & msg)
{
  Q_UNUSED (dest)
  QString reply ("\001VERSION %1:%2:%3\001");
  QString remsg = QString ("PRIVMSG %1 :%2")
                     .arg (from)
                     .arg (reply.arg (deliberate::ProgramVersion::MyName())
                                .arg (deliberate::ProgramVersion::VersionNumber())
                                .arg ("Anywhere")
                           );
  qDebug () << " version reply " << remsg;
  sock->SendData (remsg);
}



} // namespace

