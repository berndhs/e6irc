#include "qml-text-browser.h"


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


#include <QDebug>
#include <QTimer>

namespace geuzen
{

QmlTextBrowser::QmlTextBrowser (QGraphicsItem *prnt)
  :QGraphicsTextItem(prnt)
{
  setTextInteractionFlags (Qt::TextSelectableByMouse
                         | Qt::TextSelectableByKeyboard
                         | Qt::LinksAccessibleByMouse
                         | Qt::LinksAccessibleByKeyboard);
  setObjectName ("QmlTextBrowser_");
  connect (this, SIGNAL (linkActivated(const QString &)),
           this, SLOT (doActivateLink(const QString &)));
}

QRectF
QmlTextBrowser::boundingRect () const
{
  return QGraphicsTextItem::boundingRect ();
}

int
QmlTextBrowser::zero ()
{
  return 0;
}

void
QmlTextBrowser::adjustSize ()
{
  QGraphicsTextItem::adjustSize ();
}

bool
QmlTextBrowser::event (QEvent *evt)
{
  return QGraphicsTextItem::event (evt);
}

qreal
QmlTextBrowser::getHeight () const
{
  qreal h = boundingRect().height();
  return h;
}

qreal
QmlTextBrowser::getWidth () const
{
  qreal w = boundingRect().width();
  return w;
}

QString
QmlTextBrowser::getName () const
{
  return objectName();
}

void
QmlTextBrowser::setName (const QString & name)
{
  setObjectName (QString ("QmlTextBrowser_") + name);
}


void
QmlTextBrowser::setTextWidth (qreal wid)
{
  QGraphicsTextItem::setTextWidth (wid);
  emit heightChanged (getHeight());
  emit widthChanged (getWidth());
}

void
QmlTextBrowser::setHtml (const QString & html)
{
  QGraphicsTextItem::setHtml (html);
  emit heightChanged (getHeight());
}

void
QmlTextBrowser::doActivateLink (const QString & link)
{
  emit activatedLink (link);
}



} // namespace
