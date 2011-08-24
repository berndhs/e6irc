import QtQuick 1.0
import moui.geuzen.utils.static 1.0

Rectangle {
  id: mainBox
  x: 0
  y: 0
  rotation: 0
  color:  "yellow"
  property real mainWidth: width
  property real mainHeight: height
  property real restMainHeight: mainHeight
  IrcChannelGroup {
    id: channelGroup
    objectName:"ChannelGroup"
    width: mainWidth
    height: restMainHeight
    anchors { top: mainBox.top; horizontalCenter: mainBox.horizontalCenter }
    
    visible: false
    onShowControl: {
      visible = false
    }
  }
  Rectangle {
    id: controlBox
    color: "#ff77ee"
    width: mainWidth
    height: restMainHeight
    visible: !channelGroup.visible
    anchors {top: mainBox.top; horizontalCenter: mainBox.horizontalCenter }

    IrcControl {
      id: ircControl
      objectName:"ControlPanel"
      anchors { top: controlBox.top; horizontalCenter: controlBox.horizontalCenter }
      width: parent.width-2
      height: parent.height-2
      buttonHeight: isProbablyPhone ? 48 : 32
      function showControl () {
        channelGroup.visible = false
      }
      onAddedChannel: {
        channelGroup.visible = true
      }
      onHideMe: {
        channelGroup.visible = true
      }
    }
  }
}
