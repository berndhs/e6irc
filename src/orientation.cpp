#include "orientation.h"


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

namespace geuzen
{

OrientationWatcher::OrientationWatcher (QObject *parent)
  :QOrientationSensor(parent),
   lastSetting (QOrientationReading::Undefined),
   watching (true)
{
  connect (this, SIGNAL (readingChanged()), this, SLOT (changeHappened()));
  // starting it from here is too fast, the client will miss the
  // first signal
}

void
OrientationWatcher::watch (bool doWatch)
{
  watching = doWatch;
  if (watching) {
    if (!isActive()) {
      start ();
    }
    changeHappened ();
  } else {
    stop ();
  }
}

void
OrientationWatcher::changeHappened ()
{
  if (!watching) {
    return;
  }
  QOrientationReading * result = reading();
  if (result) {
    QOrientationReading::Orientation nextSetting = result->orientation();
    if (lastSetting == nextSetting) {
      return;
    }
    qreal degrees (0);
    bool  portrait (true);
    bool  doSignal (false);
    bool  inverted (false);
    switch (nextSetting) {
    case QOrientationReading::TopUp:
      degrees = -90.0;
      lastSetting = nextSetting;
      doSignal = true;
      break;
    case QOrientationReading::TopDown:
      degrees = 90;
      lastSetting = nextSetting;
      inverted = true;
      doSignal = true;
      break;
    case QOrientationReading::LeftUp:
      degrees = 180;
      lastSetting = nextSetting;
      doSignal = true;
      portrait = false;
      inverted = true;
      break;
    case QOrientationReading::RightUp:
      degrees = 0;
      lastSetting = nextSetting;
      doSignal = true;
      portrait = false;
      break;
    default:
      break;
    }
    if (doSignal) {
      emit rotationChange (degrees, portrait, inverted);
    }
  }
}

} // namespace
