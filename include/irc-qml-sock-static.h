#ifndef EGALITE_IRC_QML_SOCK_STATIC
#define EGALITE_IRC_QML_SOCK_STATIC

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

class QString;
class QRegExp;
class QStringList;

namespace egalite
{

class IrcQmlControl;
class IrcSocket;

class IrcQmlSockStatic {

private:

  friend class IrcQmlControl;


  static void TransformPRIVMSG (IrcQmlControl * context, IrcSocket *sock,
                                QStringList & result, QString & chan, 
                                QString & first, 
                                QString & rest);
  static void TransformME (IrcQmlControl * context, IrcSocket *sock,
                                QStringList & result, QString & chan, 
                                QString & first, 
                                QString & rest);
  static void TransformJOIN    (IrcQmlControl * context, IrcSocket *sock,
                                QStringList & result, QString & chan, 
                                QString & first, 
                                QString & rest);
  static void TransformDefault (IrcQmlControl * context, IrcSocket *sock,
                                QStringList & result, QString & chan, 
                                QString & first, 
                                QString & rest);

  static void ReceiveNumeric (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & num,
                         const QString & rest);
  static void ReceivePING (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void ReceivePRIVMSG (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void ReceiveQUIT (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void ReceiveJOIN (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void ReceivePART (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void ReceiveTOPIC (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void Receive004 (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void Receive332 (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void Receive353 (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void Receive366 (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void ReceiveIgnore (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);
  static void ReceiveDefault (IrcQmlControl * context, IrcSocket *sock,
                         const QString & first,
                         const QString & cmd,
                         const QString & rest);

  static bool Chomp (QRegExp & pattern, QString & result, QString & data);
};

} // namespace

#endif
