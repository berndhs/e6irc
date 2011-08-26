#include "version.h"
#include "deliberate.h"
#include <QMessageBox>
#include <QTimer>
#include <QCoreApplication>


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
 
namespace deliberate {

  QString ProgramVersion::theVersionNumber ("0.6.1");

  QString ProgramVersion::theProgramName("e6irc");
  QString ProgramVersion::theCopyright ("Copyright (C) 2011 Bernd Stramm");
  
  ProgramVersion::ProgramVersion (QString pgmname)
  {
    theProgramName = pgmname;
  }
  
  QString ProgramVersion::Version ()
  { 
    return theProgramName + QString (" Version " )
                   + VersionNumber() + " " + QString(__DATE__) + " "
		       + QString(__TIME__)
		       + QString("\r\n")
		       + theCopyright;
  }
  
  QString ProgramVersion::VersionNumber ()
  {
    return theVersionNumber;
  }

  QString ProgramVersion::ShortVersion ()
  {
    return theProgramName + QString (" Version ")
                   + theVersionNumber;
  }

  void ProgramVersion::ShowVersionWindow ()
  {
    QString versionMessage(Version());
    QMessageBox box;
    box.setText (versionMessage);
    QTimer::singleShot(30000,&box,SLOT(accept()));
    box.exec();
  }
  
  void ProgramVersion::CLIVersion ()
  {
    StdOut() << Version() << endl;
  }
  
  QString ProgramVersion::MyName()
  { 
    return theProgramName;
  }

}
