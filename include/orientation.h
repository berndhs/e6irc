#ifndef GEUZEN_ORIENTATION_H
#define GEUZEN_ORIENTATION_H


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

#include <QOrientationSensor>
#include <QOrientationReading>

QTM_USE_NAMESPACE

namespace geuzen
{
class OrientationWatcher : public QOrientationSensor {
Q_OBJECT
public:

  OrientationWatcher (QObject * parent=0);  // Note: it doesnt start by itself
                                            //      don't forget to call start()

  Q_INVOKABLE void watch (bool doWatch);

signals:

  /** !brief  0 - right edge up,  180 - left edge up
            +90 - bottom edge up  -90 - top edge up
   */
  void rotationChange ( qreal rotation, bool portrait,bool inverted);

private slots:

  void changeHappened ();

private:

  QOrientationReading::Orientation   lastSetting;
  bool                               watching;

};

} // namespace

#endif // ORIENTATION_H
