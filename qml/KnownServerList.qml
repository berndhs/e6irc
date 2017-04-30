

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

ListView {
  id: knownServerList

  property real nameWidth: 250
  property real portWidth:  100
  property real buttonWidth: rowHeight * 4
  property real rowWidth: portWidth + nameWidth + buttonWidth
  property real rowHeight: 32
  signal selectServer (string name, int port)
  signal connectServer (string name, int port)
  signal maintainServer (string name)
  signal doneLoading ()

  Component {
    id: smallDelegate 
    Rectangle {
      width: 300
      height: 28
      Text {
        text: "small delegate"
      }
    }
  }

  Component {
    id: landscapeDelegate 
    Row {
      width: knownServerList.rowWidth; height: knownServerList.rowHeight
      anchors { left: parent.left }
      Rectangle {
        id: connectButtonCol
        anchors { leftMargin: 4 }
        width: knownServerList.buttonWidth
        height: knownServerList.rowHeight
        color: "transparent"
        ChoiceButton {
          id: connectButton
          height: knownServerList.rowHeight
          width: parent.width * 0.6666
          radius: 0.5*height
          labelText: qsTr ("Connect ")
          onClicked: {
            console.log ("clicked on connect button")
            knownServerList.connectServer (sname, sport)
          }
        }
       }   
      Rectangle {
        id: serverNameCol
        anchors { leftMargin: 50 }
        width: knownServerList.nameWidth
        height: knownServerList.rowHeight
        color: "transparent"
        MouseArea {
          anchors.fill: parent
          onClicked: {
            knownServerList.currentIndex = index
            console.log ("setting currentindex to " + index)
            knownServerList.selectServer (sname, sport)
          }
          onPressAndHold: {
            knownServerList.maintainServer (sname)
          }
        }
        Text {
          anchors { 
            left: parent.left; leftMargin: 3 ; 
            verticalCenter: parent.verticalCenter 
          }
          text: sname
        }
      }
      Rectangle {
        id: serverPortCol
        width: knownServerList.portWidth
        height: knownServerList.rowHeight
        color: "transparent"
        property string portBuffer: sport
        MouseArea {
          anchors.fill: parent
          onClicked: {
            knownServerList.currentIndex = index
            knownServerList.model.setPort (index, theInput.text)
            knownServerList.selectServer (sname, serverPortCol.portBuffer)
          }
        }
        TextInput {
          id: theInput
          anchors { 
            left: parent.left
            verticalCenter: parent.verticalCenter  
          }
          horizontalAlignment: TextInput.AlignRight
          text: sport
          validator: IntValidator { bottom: 1; top: 65535 }
          onActiveFocusChanged: {
            if (activeFocus) {
              serverPortCol.color = "#ffdddd"
              knownServerList.currentIndex = index
            } else {
              serverPortCol.color = "transparent"
            }
          }
          Keys.onEnterPressed: {
            console.log ("try to set port " + theInput.text )
            knownServerList.model.setPort (index, theInput.text)
            focus = false
          }
          Keys.onReturnPressed: {
            knownServerList.model.setPort (index, theInput.text)
            focus = false
          }
        }
      }
    }
  }

  delegate:landscapeDelegate
  highlight: Rectangle { color: "#77bbff" } 
  Component.onCompleted: {
    console.log ("Done loading KnownServerList")
    knownServerList.doneLoading ()
  }
}
