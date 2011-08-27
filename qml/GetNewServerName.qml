

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


import QtQuick 1.0

Rectangle {
  id: mainBox
  width: 400
  height: 400
  color: "blue"
  opacity: 0.95
  radius: 8
  property real rowHeight: 32
  property alias itemHeight: checkOptions.itemHeight

  signal haveNewServer (string name, bool save)
  signal nevermind ()

  VisualItemModel {
    id: checkOptions
    property real itemHeight: 40
    property real totalHeight: itemHeight * count
    CheckItem {
      id: checkSave
      text: "Save"
      imageHeight: 32
      height:checkOptions.itemHeight
      font.bold: isChecked
    }
  }

  GetString {
    id: nameGet
    color: mainBox.color
    anchors.centerIn: mainBox
    inputTextColor: "#000000"
    titleText: "New Server"
    text: ""
    inputBoxRadius: 6
    radius: 12
    useCheckList: true
    checkListModel: checkOptions
    checkListColor: "transparent"
    checkListHeight: checkOptions.totalHeight
    onIsDone: {
      console.log ("input is done")
      console.log (" check height is " + checkListHeight)
      console.log (" input text is \"" + text + "\"")
      console.log (" check save " + checkSave.isChecked)
      mainBox.haveNewServer (text, checkSave.isChecked)
    }
    onEscapeHit: {
      mainBox.nevermind ()
    }
  }
}
