
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

Rectangle {
  id: ircControlBox
  objectName: "IrcControlBox"

  property alias activeServerModel: activeServerList.model
  property string baseColor: "#f7fbe0"
  property real rollDelay: 100

  property real topHeight: knownListRect.height + activeListBox.height
  property real restHeight: height - topHeight
  property real middleButtonWidth: 90
  property real standardRowHeight: 32
  property real buttonHeight: standardRowHeight
  property real mainWidth: width
  
  width: 600
  height: 400
  x: 0
  y: 0
  color: baseColor
  visible: false

  function makeVisible () { 
    console.log ("make visible " + objectName)
    visible = true 
  }
  function channelAdded () {
    console.log (objectName + " added channel")
    addedChannel ()
  }
  function askNewServer () {
    newServerNameBox.visible = true
  }
  function askNewUser () {
    newUserNameBox.visible = true
  }
  function askNewChannel () {
    newChannelNameBox.visible = true
  }

  signal hideMe ()
  signal tryConnect (string host, int port)
  signal selectActiveServer (int index)
  signal selectChannel (string name, bool select)
  signal selectNick (string name)
  signal join ()
  signal login ()
  signal addedChannel ()
  signal wantNewServer (string name, int port, bool save)
  signal wantNewUser (string nick, string realName, string pass, bool save)
  signal wantNewChannel (string name, bool save)
  signal deleteAction (string operation, string target)
  
  ChoiceButton {
    anchors {top: parent.top; right: parent.right }
    labelText: qsTr ("Show Channels")
    height: ircControlBox.buttonHeight - 2
    width: ircControlBox.mainWidth * 0.4
    radius: height * 0.5
    onClicked: {
      console.log ("Hide Button clicked x " + ircControlBox.x + "  y " + ircControlBox.y)
      ircControlBox.hideMe ()
    }
  }

  GetNewServerName {
    id: newServerNameBox
    visible: false
    z: 2
    color: Qt.darker (ircControlBox.baseColor,1.2)
    height: 300
    rowHeight: ircControlBox.standardRowHeight
    opacity: 1
    anchors {
      top: parent.top; topMargin: ircControlBox.standardRowHeight
      horizontalCenter: parent.horizontalCenter
    }
    onHaveNewServer: {
      console.log ("new server " + name + " save? " + save)
      visible = false
      ircControlBox.wantNewServer (name, 6667, save)
    }
    onNevermind: {
      visible = false
    }
  }

  GetNewChannelName {
    id: newChannelNameBox
    visible: false
    z: 2
    color: Qt.darker (ircControlBox.baseColor,1.2)
    height: 300
    rowHeight: ircControlBox.standardRowHeight
    opacity: 1
    anchors {
      top: parent.top; topMargin: ircControlBox.standardRowHeight
      horizontalCenter: parent.horizontalCenter
    }
    onHaveNewServer: {
      console.log ("new channel " + name + " save? " + save)
      visible = false
      ircControlBox.wantNewChannel (name, save)
    }
    onNevermind: {
      visible = false
    }
  }
  
  GetNewUserName {
    id: newUserNameBox
    visible: false
    z: 2
    color: Qt.darker (ircControlBox.baseColor,1.2)
    height: 300
    rowHeight: ircControlBox.standardRowHeight
    opacity: 1
    anchors {
      top: parent.top; topMargin: ircControlBox.standardRowHeight
      horizontalCenter: parent.horizontalCenter
    }
    onHaveNewUser: {
      console.log ("new user " + nick + " really " + realName + " save " + save)
      visible = false
      ircControlBox.wantNewUser (nick, realName, pass, save)
    }
    onNevermind: {
      visible = false
    }
  }

  Confirm {
    id: deleteConfirm
    visible: false
    z: 2
    color: "#ff7755"
    checkColor: "#dddddd"
    messageColor: "black"
    height: 200
    radius: 12
    title: qsTr ("Delete ?")
    anchors {
      top: parent.top; topMargin: ircControlBox.standardRowHeight
      horizontalCenter: parent.horizontalCenter
    }
    onConfirmed: {
      console.log ("delete confirmed: " + action + " for " + object)
      ircControlBox.deleteAction (action, object)
      visible = false
    }
    onDenied: {
      console.log ("delete denied: " + action + " for " + object)
      visible = false
    }
    onCancelled: {
      visible = false
    }
  }
  


/** Known Server List */

  Rectangle {
    id: knownListRect
    width: childrenRect.width; height: childrenRect.height
    color: "transparent"
    property string showString: qsTr (" --- Show Known Servers --- ")
    property string noShowString: qsTr (" Hide Known Servers ")
    ChoiceButton {
      id: knownButton
      height: ircControlBox.standardRowHeight
      width: knownServerList.nameWidth
      anchors { left: parent.left; top: parent.top }
      radius: 0.5 * height
      property string showColor: "#aaffaa"
      property string hideColor: "#d3d3d3"
      property alias seeList: knownServerList.normalSize
      color:  seeList ? hideColor : showColor

      labelText: qsTr (" --- Show Known Servers --- ")

      visible: true
     // Behavior on color { PropertyAnimation { duration: rollDelay } }
      onClicked: {
        console.log ("-------------- known list button clicked x " + ircControlBox.x + "  y " + ircControlBox.y)
        console.log ("    see list is " + seeList)
        knownServerList.toggleVisible ();
      }
      function adjust () {
        if (seeList) {
          labelText = knownListRect.noShowString
          color = hideColor
        } else {
          labelText = knownListRect.showString
          color = showColor
        }
        console.log ("    new text " + labelText)
      }
    }
      
    KnownServerList {
      id: knownServerList
      visible: true
      property bool normalSize: false
      //model: cppKnownServerModel
      property bool modelEnabled: false
      property real numRowsToShow: 3.5
      height: 0
      width: 0
      rowHeight: ircControlBox.standardRowHeight
      anchors {top : knownButton.bottom; left: knownButton.left }
      nameWidth: 300
      portWidth: 90
      clip: true
      function toggleVisible () {
        var visi = normalSize;
        console.log (" knownServerList change visi from " + visi)
        normalSize = ! visi
        adjustRows ()
        knownButton.adjust ()
      }
      function adjustRows () {
        console.log (" knownServerList adjust rows " + knownServerList.modelEnabled)
        if (knownServerList.modelEnabled) {
          var nr = cppKnownServerModel.numberOfRows
          console.log (" known server model now has " + nr)
          if (nr > 3) {
            numRowsToShow = 3.5
          } else {
            numRowsToShow = Math.min (1, nr)
          }
          if (normalSize) {
            height = numRowsToShow * rowHeight
            width = rowWidth
          } else {
            height = 0
            width = 0
          }
          console.log ("  num to show " + knownServerList.numRowsToShow)
          console.log ("  new height " + height)
          console.log ("  new width  " + width)
        }
      }
      Behavior on height { PropertyAnimation { duration: rollDelay  } }
      Behavior on width { PropertyAnimation { duration: rollDelay  } }
      onSelectServer: console.log ("picked server " + name + " port " + port)
      onConnectServer: {
        console.log (" >>>>> connect server " + name + " port " + port )
        normalSize = false
        adjustRows ()
        knownButton.adjust ()
        ircControlBox.tryConnect (name, port)
      }
      onMaintainServer: {
        deleteConfirm.askConfirmLong ("delete","server " + name,
                        qsTr ("Delete ?"), qsTr ("server ") + name)
      }
        
      Connections {
        target: cppKnownServerModel
        onContentChange: knownServerList.adjustRows ()
      }
      onDoneLoading: {
        console.log ("  done loaded KnownServerList into IrcContrl")
        console.log (" cpp model is " + cppKnownServerModel)
        model = cppKnownServerModel
        knownServerList.modelEnabled = true
        cppKnownServerModel.setEnabled (true)
      }
    }
  }

/**    Active Server List  */

  Rectangle {
    id: activeListBox
    anchors { top: knownListRect.bottom; left: parent.left }
    width: ircControlBox.width
    height: childrenRect.height
    color: "transparent"
    Rectangle {
      id: activeListHead
      height: childrenRect.height
      width: parent.width
      color: "#d0ffd0"
      Text {
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        text: qsTr ("Active Servers")
      }
    }
    ActiveServerList {
      id: activeServerList
      anchors { left: parent.left; top:activeListHead.bottom }
      nameWidth: 200
      addressWidth: 150
      rowHeight: ircControlBox.standardRowHeight
      height: 0.5 * rowHeight
      clip: true
      width: activeListBox.width
      model: cppActiveServerModel
      function resetHeight () {
        var showRows = Math.min (3.5, Math.max (cppActiveServerModel.rowCount(), 1))
        height = rowHeight * showRows
      }
      onDisconnectServer: {
        console.log ("disconnect from " + index)
        model.disconnectServer (index)
      }
      onSelectedServer: {
        ircControlBox.selectActiveServer (index)
      }
      Connections {
        target: cppActiveServerModel
        onSelectRow: {
          console.log (" Select Row " + row)
          activeServerList.selectRow (row)
        }
        onContentChange: {
          console.log (" Active Server List data change ")
          activeServerList.resetHeight ()
        }
      }
      Component.onCompleted: {
        resetHeight ()
        console.log ("have active server list, height is " + activeServerList.height )
      }
    }
  }

/** Bottom Section with channel list, nick list, join button, login button */

  Rectangle {
    id: bottomFlow
    width: ircControlBox.width 
    property real space : 4
    property real subListWidth: width * 0.4
    property real middleButtonWidth: width - 2*subListWidth - 2*space
                    
    anchors { 
      top: activeListBox.bottom; 
      horizontalCenter:ircControlBox.horizontalCenter 
    }
    Rectangle {
      id: channelListBox
      color: "transparent"
      width: bottomFlow.subListWidth
      height: restHeight
      anchors { left: bottomFlow.left; top: parent.top }
      Rectangle {
        id: channelHeader
        height: childrenRect.height
        width: parent.width
        color: "#d0d0ff"
        Text {
          width: parent.width
          horizontalAlignment: Text.AlignHCenter
          text: qsTr ("Channel Names")
        }
      }
      ListView {
        Component {
          id: channelDelegate
          Rectangle {
            id: channelDelegateBox 
            width: channelListBox.width
            height: ircControlBox.buttonHeight
            color: "transparent"
            property bool selected: false
            MouseArea {
              anchors.fill: parent
              onClicked: { 
                channelList.currentIndex = index; 
                channelDelegateBox.selected = !channelDelegateBox.selected
                ircControlBox.selectChannel (name, channelDelegateBox.selected) 
                console.log (" channel box width " 
                             + parent.width + " name " + name
                             + " selected " + channelDelegateBox.selected)
              }
              onPressAndHold: {
                deleteConfirm.askConfirmLong ("delete","channel " + name,
                                 qsTr ("Delete ?"),
                                 qsTr ("Channel ") + name)
              }
            }
            Row {
              width: parent.width
              height: parent.height
              Text {
                id: channelOp
                width: 48
                text: inUse 
                      ? qsTr ("On") 
                      : (selected ? qsTr("/join") : "")
              }
              Text {
                id: channelNameText
                width: channelListBox.width - channelOp.width 
                text: name
              }
            }
          }
        }
        id: channelList
        width: parent.width
        height: parent.height - channelHeader.height
        clip: true
        anchors { top: channelHeader.bottom; left: channelListBox.left }
        model: cppChannelListModel
        highlightMoveVelocity: 2000
        highlight: Rectangle { color: "#ffccee"; width:channelListBox.width}
        delegate: channelDelegate
      }
    }

    Column {
      id: middleButtons
      anchors { horizontalCenter: bottomFlow.horizontalCenter }
      spacing: 6
      ChoiceButton {
        id: joinButton 
        labelText: qsTr ("<-- Join")
        radius: 8
        height: ircControlBox.standardRowHeight
        width: middleButtonWidth
        onClicked: {
          ircControlBox.join ()
        }
      }
      ChoiceButton {
        id: loginButton 
        labelText: qsTr ("Login -->")
        radius: 8
        height: ircControlBox.standardRowHeight
        width: middleButtonWidth
        onClicked: {
          ircControlBox.login ()
        }
      }
    }
    
    Rectangle {
      id: nickListBox
      color: "transparent"
      width: bottomFlow.subListWidth
      height: restHeight
      anchors { right: bottomFlow.right; leftMargin: 2 }
      Rectangle {
        id: nickHeader
        height: childrenRect.height
        width: parent.width
        color: "#d0ffd0"
        Text {
          width: parent.width
          horizontalAlignment: Text.AlignHCenter
          text: qsTr ("Nick Names")
        }
      }
      ListView {
        Component {
          id: nickDelegate
          Rectangle {
            id: nickDelegateBox 
            width: nickListBox.width
            height: ircControlBox.buttonHeight
            color: "transparent"
            MouseArea {
              height: ircControlBox.buttonHeight
              anchors.fill: parent
              onClicked:  { 
                nickList.currentIndex = index; 
                ircControlBox.selectNick (name) 
              }
              onPressAndHold: {
                deleteConfirm.askConfirmLong ("delete","nick " + name,
                                 qsTr ("Delete ?"),
                                 qsTr ("Nick ") + name)
              }
            }
            Text {
              width: nickListBox.width
              text: name
            }
          }
        }
        id: nickList
        width: parent.width
        height: parent.height - nickHeader.height
        clip: true
        anchors { top: nickHeader.bottom; left: nickListBox.left }
        model: cppNickListModel
        delegate: nickDelegate
        highlight: Rectangle { color: "#eeccff"; width:nickListBox.width }
      }
    } 
  }
    

  Component.onCompleted: {
    console.log ("loaded IrcControlBox")
  }
}
