
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

import QtQuick 1.0

Rectangle {
  id: checkItem
  color: "transparent"
  height: Math.max (checkBox.height, checkText.height)
  width: checkBox.width + checkText.width + textIndent
  property bool isChecked: false
  property real textIndent: 8
  property string imageTrue: "/checked-yes.png"
  property string imageFalse: "/checked-no.png"
  property alias text: checkText.text
  property alias font: checkText.font
  property alias imageHeight: checkBox.height
  property alias imageWidth: checkBox.width

  signal userChanged (bool checked)
 
  
  Image {
    id: checkBox
    source: checkItem.isChecked ? checkItem.imageTrue : checkItem.imageFalse
    height: 64
    width: 64
    anchors {
      left: checkItem.left
      verticalCenter: checkItem.verticalCenter
    }
  }
  Text {
    id: checkText
    anchors {
      left: checkBox.right
      leftMargin: checkItem.textIndent
      verticalCenter: checkItem.verticalCenter
    }
    text: "Item Text"
  }
  MouseArea {
    anchors.fill: parent
      
    onClicked: {
      checkItem.isChecked = ! checkItem.isChecked
      checkItem.userChanged (checkItem.isChecked)
    }
  }
}