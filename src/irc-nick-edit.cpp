
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
 *****************************************************************/

#include "irc-nick-edit.h"
#include "cert-store.h"
#include <QStringList>
#include <QMessageBox>
#include <QTimer>
#include <QDebug>

namespace egalite
{

IrcNickEdit::IrcNickEdit (QWidget *parent)
  :QDialog (parent),
   haveNick (false)
{
  Connect ();
}

void
IrcNickEdit::Connect ()
{
}

void
IrcNickEdit::ClearForm ()
{
}

void
IrcNickEdit::Exec ()
{
}

void
IrcNickEdit::Cancel ()
{
}

void
IrcNickEdit::SaveNick ()
{
}

void
IrcNickEdit::DeleteNick ()
{
}

bool
IrcNickEdit::Lookup (QString nick)
{
  QString ircUser;
  QString pass;
  QString pmsg;
  QString qmsg;
  haveNick = CertStore::IF().GetIrcIdent (nick, ircUser, pass);
  CertStore::IF().GetIrcMessages (nick, pmsg, qmsg);
  if (haveNick) {
  } else {
    ClearForm ();
  }
  return haveNick;
}


} // namespace

