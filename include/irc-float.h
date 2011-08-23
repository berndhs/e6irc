#ifndef IRC_FLOAT_H
#define IRC_FLOAT_H

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

#include <QDeclarativeView>
#include "irc-abstract-channel.h"
#include <QResizeEvent>
#include <QCloseEvent>

class QCloseEvent;

namespace egalite
{

class IrcFloat : public QDeclarativeView
{
Q_OBJECT

public:

  IrcFloat (QWidget *parent=0);

public slots:

  void AddChannel (IrcAbstractChannel *chan);
  void RemoveChannel (IrcAbstractChannel *chan);
  void Hide ();
  void Show ();

protected:

  void closeEvent (QCloseEvent * event);
  void resizeEvent (QResizeEvent * event);

private:

  void CheckQml ();

  IrcAbstractChannel      *chanBox;
  QGraphicsObject         *qmlRoot;
  QDeclarativeItem        *qmlChannel;

};

} // namspace

#endif
