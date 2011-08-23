


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
  id: channelGroup
  height: 400
  width: 600
  x: 0
  y: 0
  color: "#f0f0f3"

  property real channelTopMargin: 24

  signal selectedChannel (string link)
  signal changedChannelBox (real newWidth, real newHeight)
  signal hideMe ()

  function addChannel () {
    console.log ("  channelGroup add ")
    var compo =  Qt.createComponent("IrcChannelBox.qml")
    console.log (" create returns " + compo + "  status " + compo.status)
    if (compo.status == Component.Error) {
      console.log ("    create error " + compo.errorString())
    }
    if (compo.status == Component.Ready) {
      var newBox = compo.createObject (channelGroup)
      newBox.visibleHeight = channelGroup.height
      newBox.topMargin = channelList.height
      newBox.width = channelGroup.width
      newBox.anchors.top = channelList.bottom
      newBox.dynamic = true
      return newBox
    }
    return null
  }
  function setChannelList (theList) {
    console.log ("Channel Group list " + theList)
    channelListText.text = theList
  }
  function adjustChannelHeight (newTopHeight) {
    channelTopMargin = newTopHeight
    changedChannelBox (width, height, 0, channelTopMargin)
  }
  Rectangle {
    id: channelList
    width: channelGroup.width
    height: childrenRect.height
    color: "transparent"
    z: channelGroup.z + 2
    anchors {top: channelGroup.top; left: channelGroup.left}
    Text {
      id: channelListText
      anchors {top: parent.top; left: parent.left}
      width: parent.width
      wrapMode: Text.Wrap
      text: ""
      onLinkActivated: {
        console.log (" ChannelGroup link activated " + link)
        channelGroup.selectedChannel (link)
      }
      onHeightChanged: {
        channelGroup.adjustChannelHeight (channelList.height)
      }
    }
  }
  Rectangle {
    id: emptyBox
    width: 200; height: 100
    anchors.centerIn: parent
    color: "#ffffcc"
    MouseArea {
      anchors.fill: parent
      onPressed: {
       console.log (" clicked empty box to hide channel group")
        channelGroup.hideMe ()
      }
    }
    Text {
      anchors.centerIn: parent
      horizontalAlignment: Text.AlignHCenter
      text: qsTr ("No Channels\n\n( Close )")
    }
  }
  Component.onCompleted: {
    console.log ("loaded IrcChannelGroup")
  }
}
