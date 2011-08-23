
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

#include <QApplication>
#include <QDesktopWidget>
#include <QDeclarativeView>
#include <QDeclarativeEngine>
#include <QDeclarativeContext>
#include <QIcon>
#include <QFont>
#include <QSystemDeviceInfo>
#include <qdeclarative.h>
#include "qml-text-browser.h"
#include "orientation.h"

#include <QDebug>

QTM_USE_NAMESPACE

int
main (int argc, char *argv[])
{
  QApplication app (argc, argv);

  QSystemDeviceInfo sdi;

  QString imsi = sdi.imsi();
  QString imei = sdi.imei();
  bool isPhone (!(imsi.isEmpty() || imei.isEmpty()));

  QDeclarativeView * view = new QDeclarativeView;
  QDeclarativeEngine * engine = view->engine();
  QDeclarativeContext * context = view->rootContext();

  if (context) {
    context->setContextProperty ("isProbablyPhone", QVariant(isPhone));
  }

  if (isPhone) {
    QFont appFont = app.font();
    appFont.setPointSize (appFont.pointSize() + 4);
    app.setFont (appFont);
  }

  const char uri[] = "moui.geuzen.utils.static";

  qmlRegisterType<geuzen::QmlTextBrowser>(uri, 1, 0, "GeuzenTextBrowser");
  qmlRegisterType<geuzen::OrientationWatcher>(uri, 1, 0, "GeuzenOrientation");

  view->setWindowIcon (QIcon (":/icon64.png"));
  view->setSource (QUrl ("qrc:/Main.qml"));
  if (isPhone) {
    view->setGeometry (app.desktop()->screenGeometry());
    view->showFullScreen ();
  } else {
    view->setGeometry (0,0,600,400);
  }
  qDebug () << " view set to size " << view->size();
  view->setResizeMode (QDeclarativeView::SizeRootObjectToView);

  view->show ();
  QObject::connect (engine, SIGNAL (quit()),&app, SLOT(quit()));
  int ok = app.exec ();
  return ok;
}
