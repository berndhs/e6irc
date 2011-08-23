
#include "irc-float.h"

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

#include <QCloseEvent>
#include "irc-text-browser.h"
#include <QRectF>
#include <QMetaObject>
#include <QMessageBox>
#include <QDebug>

namespace egalite
{

IrcFloat::IrcFloat (QWidget *parent)
  :QDeclarativeView (parent),
   chanBox (0),
   qmlRoot (0),
   qmlChannel (0)
{
  setResizeMode (QDeclarativeView::SizeRootObjectToView);
  qmlRegisterType<IrcTextBrowser>
              ("net.sf.egalite",1,0,"IrcTextBrowser");
  setSource (QUrl ("qrc:///qml/IrcFloatBox.qml"));
  qmlRoot = rootObject ();
  if (!qmlRoot) {
    QMessageBox::critical (this, "Fatal", "QML Float Root Missing");
    abort ();
  }
  QRectF scene = sceneRect ();
  qreal width = scene.width();
  qreal height = scene.height();
  qDebug () << __PRETTY_FUNCTION__ << " new size w " << width << " h " << height;
  qmlRoot->setProperty ("width", width);
  qmlRoot->setProperty ("height", height);
  QString chanName = qmlRoot->property ("floatName").toString();
  qmlChannel = qmlRoot->findChild<QDeclarativeItem*>(chanName);
  qDebug () << "   qmlChannel " <<   qmlChannel;
}

void
IrcFloat::Hide ()
{
  hide ();
}

void
IrcFloat::Show ()
{
  show ();
  raise ();
}

void
IrcFloat::AddChannel (IrcAbstractChannel *chan)
{
  if (chanBox != 0 || chan == 0) {
    return;
  }
  chanBox = chan;
  connect (chanBox, SIGNAL (HideMe()), this, SLOT (Hide()));
  chanBox->SetQmlItem (qmlChannel);
  qmlChannel->setProperty ("boxLabel", chan->Name());
  QObject * model = qobject_cast<QObject*>(chan->userNamesModel());
  QMetaObject::invokeMethod (qmlChannel, "setModel",
      Q_ARG (QVariant, qVariantFromValue (model)));
  setWindowTitle (tr ("IRC channel %1").arg(chan->Name()));
  chan->SetTopmost (true);
  chan->UpdateCooked ();
  chan->RefreshNames ();
  chan->RefreshTopic ();
}

void
IrcFloat::RemoveChannel (IrcAbstractChannel *chan)
{
  if (chanBox == chan) {
    disconnect (chanBox, 0, this, 0);
    chanBox = 0;
  }
}

void
IrcFloat::closeEvent (QCloseEvent *event)
{
  if (chanBox) {
    chanBox->Part ();
  }
  QDeclarativeView::closeEvent (event);
}
void
IrcFloat::resizeEvent (QResizeEvent *event)
{
  CheckQml ();
#if 0
  if (event && qmlRoot) {
    QSize size = event->size();
    qreal width = size.width();
    qreal height = size.height();
    //qDebug () << __PRETTY_FUNCTION__ << " new size w " << width << " h " << height;
    qmlRoot->setProperty ("width", width);
    qmlRoot->setProperty ("height", height);
  }
#else
  QDeclarativeView::resizeEvent (event);
#endif
}

void
IrcFloat::CheckQml ()
{
  QGraphicsObject * qr = rootObject ();
  if (qmlRoot != qr && qmlRoot != 0) {
    qDebug () << __PRETTY_FUNCTION__ << " QML Root Changed !! " << qmlRoot << qr;
    qmlRoot = qr;
  }
}

} // namespace
