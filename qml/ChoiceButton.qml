

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


import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
  id: button
  signal clicked ()
  signal pressAndHold ()
  signal pressed ()
  property alias labelText : label.text
  property alias labelHeight: label.height
  property alias labelWidth: label.width
  property real commonMargin: 4
  property color topColor: "#d3d3d3"
  property color bottomColor: "#f0f0f0"

  signal labelChanged (string text)

  width: 100
  height: 100
  radius: 5
  gradient: Gradient {
    GradientStop { position: 0.0; color: topColor }
    GradientStop { position: 1.0; color: bottomColor }
  }
  Rectangle {
      id: buttonShadow
      anchors.centerIn: button;
      width: button.width +4;
      height: button.height+4;
      radius: 4;
      z:button.z-1;
      visible: false;
      color: Qt.darker(bottomColor);
  }

  anchors { 
    topMargin: commonMargin; bottomMargin: commonMargin; 
    leftMargin: commonMargin; rightMargin: commonMargin
  }
  MouseArea {
    anchors.fill: button
    onClicked: { button.clicked (); buttonShadow.visible=true; }
    onPressAndHold: { button.pressAndHold () }
    onPressed: { button.pressed (); buttonShadow.visible=true;  }
  }
  Text { 
    id: label
    text: "Button"
    font.pixelSize: Screen.pixelDensity * 4;
    z: parent.z
    wrapMode:Text.Wrap
    width: parent.width
    anchors.centerIn: parent 
    horizontalAlignment: Text.AlignHCenter
    onTextChanged: { button.labelChanged (label.text) }
 }
}
