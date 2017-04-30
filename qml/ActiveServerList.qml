

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
  id: activeServerList

  property real nameWidth: 200
  property real addressWidth: 150
  property real portWidth:  72
  property real buttonWidth: 100
  property real rowHeight: 32

  signal disconnectServer (int index)
  signal selectedServer (int index)

  function selectRow (row) {
    currentIndex = row
    selectedServer (row)
  }

  Component {
    id: landscapeDelegate 
    Row {
      id: serverRow
      width: activeServerList.width
      height: childrenRect.height //activeServerList.rowHeight
      spacing: 4
      anchors.left: parent.left
      Rectangle {
        id: connectButtonCol
        width: activeServerList.buttonWidth
        height: activeServerList.rowHeight
        color: "transparent"
        ChoiceButton {
          id: connectButton
          height: activeServerList.rowHeight
          width: parent.width * 0.6666
          anchors { horizontalCenter: connectButtonCol.horizontalCenter }
          radius: 0.5*height
          labelText: qsTr ("Leave")
          onClicked: {
            activeServerList.disconnectServer (index)
          }
        }
      }
      
      Rectangle {
        id: baseNameCol
        width: nameText.width 
        height: activeServerList.rowHeight
        color: "transparent"
        MouseArea {
          anchors.fill: parent
          onPressed: {
            activeServerList.currentIndex = index;
            activeServerList.selectedServer (index);
          }
        }
        Text {
          id: nameText
          anchors { 
            left: parent.left; leftMargin: 3 ; 
            verticalCenter: parent.verticalCenter 
          }
          text: haverealname ? realname : basename
        }
      }    
      Rectangle {
        id: trafficCountCol
        width: countText.width
        height: activeServerList.rowHeight
        color: "transparent"
        MouseArea {
          anchors.fill: parent
          onPressed: {
            activeServerList.currentIndex = index;
            activeServerList.selectedServer (index);
          }
        }
        Text {
          id: countText
          anchors { 
            left: parent.left; leftMargin: 3 ; 
            verticalCenter: parent.verticalCenter 
          }
          text:  "<span style=\"font-size:small\">" 
                 + qsTr(" in:") + bytesin + qsTr (" out:") + bytesout +  " "
                 + "</span>"
        }
      }  
      Rectangle {
        id: addressCol
        width: addressText.width //activeServerList.addressWidth
        height: activeServerList.rowHeight
        color: "transparent"
        MouseArea {
          anchors.fill: parent
          onPressed: {
            activeServerList.currentIndex = index;
            activeServerList.selectedServer (index);
          }
        }
        Text {
          id: addressText
          anchors { 
            left: parent.left; leftMargin: 3 
            verticalCenter: parent.verticalCenter 
          }
          text: "<span style=\"font-size:small\">" + address + "</span>"
        }
      }
      Rectangle {
        id: portCol
        width: thePortText.width
        height: activeServerList.rowHeight
        color: "transparent"
        MouseArea {
          anchors.fill: parent
          onPressed: {
            activeServerList.currentIndex = index;
            activeServerList.selectedServer (index);
          }
        }
        Text {
          id: thePortText
          anchors { 
            left: parent.left
            verticalCenter: parent.verticalCenter  
          }
          horizontalAlignment: TextInput.AlignRight
          text:  "<span style=\"font-size:small\">" + port + "</span>"
        }
      }
    }
    
  }

  delegate: landscapeDelegate
  highlight: Rectangle {
    color: (activeServerList.currentIndex < 0 ? "transparent" : "#77ddff")
  }
  Component.onCompleted: console.log ("Done loading ActiveServerList")

}
