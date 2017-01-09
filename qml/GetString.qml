import QtQuick 2.5


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


Rectangle {
  id: getStringBox
  width: 300
  height: childrenRect.height
  color: "white"
  property real topOffset: 12
  property real boxMargin: 4
  property real checkSpacing: 4
  property real inputHeight: 32
  property real checkBoxTopMargin: 16
  property real checkBoxIndent: 8
  property real titleHeight: 32
  property bool useCheckList: false
  property real checkListHeight: 100
  property alias text: stringInputText.text
  property alias titleText: titleBoxText.text
  property alias boxFrame: stringBox.border
  property alias inputTextColor: stringInputText.color
  property alias inputBackgroundColor: stringBox.color
  property alias inputBoxRadius: stringBox.radius
  property alias inputBoxBorder: stringBox.border
  property alias echoModus: stringInputText.echoMode
  property alias checkListColor: checkListBox.color
  property alias checkListModel: checkList.model
  property alias checkListDelegate: checkList.delegate
  property alias suppressInitialCaps: stringInputText.noInitialCaps
  
  property real insideWidth:getStringBox.width - 2*getStringBox.border.width

  signal isDone ()
  signal tabHit ()
  signal cancelled ()
  
  function takeFocus () {
    stringInputText.forceActiveFocus()
    console.log ("taking focus: " + objectName)
  }
  
  Rectangle {
    id: titleBox
    color: "transparent"
    width: getStringBox.insideWidth
    height: (titleBoxText.length === 0) ? 0 : getStringBox.titleHeight
    anchors {
      top: getStringBox.top
      horizontalCenter: getStringBox.horizontalCenter
    }

    Text {
      id: titleBoxText
      text: ""
      anchors.centerIn: titleBox
    }
    MouseArea {
      anchors.fill: parent
      onPressAndHold: {
        getStringBox.cancelled()
      }
    }
  }

  Rectangle {
    id: stringBox
    color: "white"
    border.color: "#00ffff"
    border.width: 0
    width: getStringBox.insideWidth - 2 * getStringBox.boxMargin
    height: getStringBox.inputHeight
    anchors { 
      top: titleBox.bottom; topMargin: getStringBox.topOffset
      horizontalCenter: getStringBox.horizontalCenter
    }
    TextInput {
      id: stringInputText
      width: stringBox.width
      color: "red"
      text: "input?"
      property bool noInitialCaps: false
      anchors {
        left: stringBox.left
        leftMargin: stringBox.border.width
        verticalCenter: stringBox.verticalCenter
      }
      Keys.onReturnPressed: { getStringBox.isDone () }
      Keys.onEnterPressed: { getStringBox.isDone () }
      Keys.onTabPressed: { getStringBox.tabHit () }
      Keys.onEscapePressed: { getStringBox.cancelled () }
    }
  }
 
  Rectangle {
    id: checkListBox
    width: getStringBox.insideWidth - 2*getStringBox.checkBoxIndent
    height: getStringBox.useCheckList ? getStringBox.checkListHeight : 0
    visible: getStringBox.useCheckList
    color: Qt.lighter (getStringBox.color)
    anchors {
      top: stringBox.bottom; topMargin: getStringBox.checkBoxTopMargin
      horizontalCenter: getStringBox.horizontalCenter
    }
    ListView {
      id: checkList
      height: parent.height
      width: parent.width
      clip: true
      model: 0
    }
  }
 
}
