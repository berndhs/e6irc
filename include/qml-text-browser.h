#ifndef GEUZEN_QML_TEXT_BROWSER_H
#define GEUZEN_QML_TEXT_BROWSER_H

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


#include <QGraphicsTextItem>
#include <QGraphicsItem>
#include <QRectF>
#include <QEvent>

namespace geuzen
{

class QmlTextBrowser : public QGraphicsTextItem
{
Q_OBJECT

public:

  QmlTextBrowser (QGraphicsItem * parent=0);

  Q_PROPERTY(qreal height READ getHeight NOTIFY heightChanged) 
  Q_PROPERTY(qreal width READ getWidth WRITE widthChanged)
  Q_PROPERTY(QString name READ getName WRITE setName) 

  Q_INVOKABLE int zero ();

  Q_INVOKABLE void setHtml (const QString & html);
  Q_INVOKABLE void setTextWidth (qreal wid);
  Q_INVOKABLE QRectF boundingRect () const;
  Q_INVOKABLE qreal getHeight () const;
  Q_INVOKABLE qreal getWidth () const;
  Q_INVOKABLE QString getName () const;
  Q_INVOKABLE void setName (const QString & name);
  Q_INVOKABLE void adjustSize ();

private slots:

  void doActivateLink (const QString & link);

signals:

  void activatedLink (const QString & link);
  void heightChanged (qreal height);
  void widthChanged (qreal width);

protected:

  bool event (QEvent *evt);

private:

};

} // namespace


#endif
