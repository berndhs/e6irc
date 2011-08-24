
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
#include "e6irc.h"
#include "deliberate.h"
#include "version.h"

#include <QDebug>

QTM_USE_NAMESPACE

int
main (int argc, char *argv[])
{
  QCoreApplication::setApplicationName ("egalite");
  QCoreApplication::setOrganizationName ("BerndStramm");
  QCoreApplication::setOrganizationDomain ("egalite.sourceforge.net");
  deliberate::ProgramVersion pv ("E6Irc");
  QCoreApplication::setApplicationVersion (pv.Version());
  QApplication app (argc, argv);

  QSystemDeviceInfo sdi;

  QString imsi = sdi.imsi();
  QString imei = sdi.imei();
  bool isPhone (!(imsi.isEmpty() || imei.isEmpty()));
  qDebug () << __PRETTY_FUNCTION__ << " phone ? " << isPhone;
  egalite::E6Irc * view = new egalite::E6Irc (0, isPhone);
  QDeclarativeEngine * engine = view->engine();
  QDeclarativeContext * context = view->rootContext();

  if (context) {
    context->setContextProperty ("isProbablyPhone", QVariant(isPhone));
  }
  
  if (isPhone) {
    QFont appFont = app.font();
    appFont.setPointSize (appFont.pointSize() + 6);
    app.setFont (appFont);
    qDebug () << " it is a phone, set point size to " << appFont.pointSize();
  }

  const char uri[] = "moui.geuzen.utils.static";

  qmlRegisterType<geuzen::QmlTextBrowser>(uri, 1, 0, "GeuzenTextBrowser");
  qmlRegisterType<geuzen::OrientationWatcher>(uri, 1, 0, "GeuzenOrientation");

  view->setWindowIcon (QIcon (":/icon64.png"));
  view->run ();
  if (isPhone) {
    view->setGeometry (app.desktop()->screenGeometry());
    view->showFullScreen ();
  } else {
    view->setGeometry (0,0,600,400);
  }
  view->show ();
  qDebug () << " view has size " << view->size();
  view->setResizeMode (QDeclarativeView::SizeRootObjectToView);

  QObject::connect (engine, SIGNAL (quit()),&app, SLOT(quit()));
  int ok = app.exec ();
  return ok;
}
