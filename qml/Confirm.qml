import QtQuick 1.0


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


Rectangle {
  id: confirmBox
  width: 300
  height: 300
  color: "red"
  property real titleHeight: 32

  function askConfirmLong (theAction, theObject, theTitle, theMessage) {
    title = theTitle
    action = theAction
    object = theObject
    message = theMessage
    visible = true
  }
  function askConfirm () {
    visible = true
  }

  signal confirmed (string action, string object)
  signal denied (string action, string object)
  signal cancelled ()

  function decided () {
    if (checkYes.isChecked) {
      confirmed (action, object)
    } else {
      denied (action, object)
    }
  }

  property alias title: titleText.text
  property string action: "do"
  property string object: "nothing"
  property alias message: questionText.text
  property alias yesText: checkYes.text
  property alias noText: checkNo.text
  property alias checkWidth: checkOptions.itemWidth
  property alias checkColor: checkListBox.color
  property alias titleColor: titleText.color
  property alias messageColor: questionText.color

  property real restHeight: height - titleBox.height - questionBox.height
  
  Rectangle {
    id: titleBox
    color: "transparent"
    width: confirmBox.width
    height: (titleText.length === 0) ? 0 : confirmBox.titleHeight
    anchors {
      top: confirmBox.top
      horizontalCenter: confirmBox.horizontalCenter
    }

    Text {
      id: titleText
      text: ""
      anchors.centerIn: titleBox
    }
    MouseArea {
      anchors.fill: parent
      onPressAndHold: {
        confirmBox.cancelled()
      }
    }
  }

  Rectangle {
    id: questionBox
    color: "white"
    width: confirmBox.width
    height: questionText.height
    anchors { 
      top: titleBox.bottom
      horizontalCenter: confirmBox.horizontalCenter
    }
    Text {
      id: questionText
      width: questionBox.width
      color: "red"
      text: "Do?"
      wrapMode: Text.WordWrap
      anchors {
        top: questionBox.top
        horizontalCenter: questionBox.horizontalCenter
      }
    }
  }
 
  VisualItemModel {
    id: checkOptions
    property real itemHeight: 40
    property real itemWidth: 120
    CheckItem {
      id: checkYes
      text: "Yes"
      imageHeight: 32
      height:checkOptions.itemHeight
      font.bold: isChecked
      isChecked: false
      imageTrue: "/checked-yes.png"
      imageFalse: "/checked-no.png"
      onUserChanged: {
        checkNo.isChecked = ! checked
      }
    }
    CheckItem {
      id: checkNo
      text: "No"
      imageHeight: 32
      height:checkOptions.itemHeight
      font.bold: isChecked
      isChecked: true
      imageTrue: "/checked-yes.png"
      imageFalse: "/checked-no.png"
      onUserChanged: {
        checkYes.isChecked = ! checked
      }
    }
    Rectangle {
      id: spaceRect1
      color: "transparent"
      width: checkOptions.itemWidth * 0.5
      height: checkOptions.itemHeight * 0.5
    }
    Rectangle {
      id: spaceRect2
      color: "transparent"
      width: checkOptions.itemWidth * 0.5
      height: checkOptions.itemHeight * 0.5
    }
    ChoiceButton {
      id: goButton
      labelText: "OK"
      height:checkOptions.itemHeight * 0.9
      width:checkOptions.itemWidth * 0.8
      onClicked: {
        confirmBox.decided ()
      }
    }
    ChoiceButton {
      id: cancelButton
      labelText: "Cancel"
      height:checkOptions.itemHeight * 0.9
      width:checkOptions.itemWidth * 0.8
      onClicked: {
        confirmBox.cancelled ()
      }
    }
  }

  Rectangle {
    id: checkListBox
    width: confirmBox.width * 0.95
    height: confirmBox.restHeight - confirmBox.radius
    color: Qt.lighter (confirmBox.color)
    anchors {
      top: questionBox.bottom
      horizontalCenter: confirmBox.horizontalCenter
    }
    GridView {
      id: checkList
      height: parent.height
      width: parent.width
      cellHeight: checkOptions.itemHeight
      cellWidth: confirmBox.checkWidth
      clip: true
      model: checkOptions
    }
  }
 
}
