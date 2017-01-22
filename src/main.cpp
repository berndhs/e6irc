
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

#include <QApplication>
#include <QDesktopWidget>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QDesktopWidget>
#include <QStringList>
#include <QRect>
#include <QSize>
#include <QIcon>
#include <QFont>
#include <QSysInfo>
#include "qml-text-browser.h"
#include "orientation.h"
#include "e6irc.h"
#include "deliberate.h"
#include "version.h"
#include "main.h"

#include <QDebug>
#include <QTimer>

class ArgFlags {
public:
  
  ArgFlags ()
    :wantHelp (false),
     wantVersion (false),
     wantPhone (false),
     wantNotPhone (false)
  {}
  
  bool wantHelp;
  bool wantVersion;
  bool wantPhone;
  bool wantNotPhone;
};

void
checkOptions (const QStringList & argList, ArgFlags & flags)
{
  flags.wantHelp = argList.contains ("-h") || argList.contains ("--help");
  flags.wantVersion = argList.contains ("-v") || argList.contains ("--version");
  flags.wantPhone = argList.contains ("-p") 
                    || argList.contains ("--phone")
                    || argList.contains ("--smallscreen");
  flags.wantNotPhone = argList.contains ("-n") || argList.contains ("--notphone");
  egalite::globalAndroid = flags.wantPhone && !flags.wantNotPhone;
}

namespace egalite {
  bool globalAndroid;
  bool isPhone;
}

int
main (int argc, char *argv[])
{
  QCoreApplication::setApplicationName ("e6irc");
  QCoreApplication::setOrganizationName ("BerndStramm");
  QCoreApplication::setOrganizationDomain ("com.berndhs");
  deliberate::ProgramVersion pv ("E6Irc");
  QCoreApplication::setApplicationVersion (pv.Version());

  QApplication app (argc, argv);
  
  ArgFlags options;
  
  checkOptions (app.arguments(), options);

  QSettings  settings;
  deliberate::SetSettings (settings);
  settings.setValue ("program",pv.MyName());

  bool isPhone (true);
  bool wantPhone = (isPhone || options.wantPhone) && !options.wantNotPhone;
  qDebug () << __PRETTY_FUNCTION__ << " phone ? " << wantPhone;
qDebug() << Q_FUNC_INFO << __LINE__;
  egalite::E6Irc * irc = new egalite::E6Irc (0, wantPhone);
  if (!irc) {
    qDebug()<< "Memory probelm, allocation failed!" ;
    exit(1);
  }
  qDebug() << Q_FUNC_INFO << __LINE__;

  QQmlEngine * engine = irc->engine();
  qDebug() << Q_FUNC_INFO << __LINE__;
  QQmlContext * context = irc->rootContext();
  qDebug() << Q_FUNC_INFO << __LINE__;

  if (context) {
    context->setContextProperty ("isProbablyPhone", QVariant(wantPhone));
  }

  QFont appFont = app.font();
  appFont.setPixelSize(14);
  app.setFont (appFont);
  qDebug () << " it is a phone, set point size to " << appFont.pixelSize();

  const char uri[] = "moui.geuzen.utils.static";

  qmlRegisterType<geuzen::QmlTextBrowser>(uri, 1, 0, "GeuzenTextBrowser");
  qmlRegisterType<geuzen::OrientationWatcher>(uri, 1, 0, "GeuzenOrientation");

  irc->setIcon (QIcon (":/icon64.png"));
  irc->setResizeMode (QQuickView::SizeViewToRootObject);
  qDebug() << Q_FUNC_INFO << __LINE__;\
  QTimer::singleShot(2000,irc,SLOT(run()));
//  irc->run ();
  qDebug() << Q_FUNC_INFO << __LINE__;
  if (egalite::globalAndroid) {
    irc->setGeometry (app.desktop()->screenGeometry());
//    irc->showFullScreen ();
  }
  qDebug() << Q_FUNC_INFO << __LINE__;
  irc->show ();
  qDebug() << Q_FUNC_INFO << __LINE__;
  qDebug () << " irc has size " << irc->size();

  QObject::connect (irc, SIGNAL (quit()), &app, SLOT (quit()));
  int ok = app.exec ();
  return ok;
}
