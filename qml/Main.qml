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
  property real restMainHeight: mainHeight - quitButton.height
  ChoiceButton {
    id: quitButton
    topColor : Qt.darker (mainBox.color)
    bottomColor: "#2090f0"
    border.color:  Qt.lighter (mainBox.color)
    border.width: 2
    height: 32
    anchors {top: mainBox.top; horizontalCenter: mainBox.horizontalCenter}
    labelText: qsTr ("Quit")
    onClicked: {
      Qt.quit()
    }
  }
  IrcChannelGroup {
    id: channelGroup
    anchors { top: quitButton.bottom; horizontalCenter: mainBox.horizontalCenter }
    
    visible: false
  }
  Rectangle {
    id: controlBox
    color: "#ff77ee"
    width: mainWidth
    height: restMainHeight
    visible: true
    anchors {top: quitButton.bottom; horizontalCenter: mainBox.horizontalCenter }
    IrcControl {
      id: ircControl
      objectName:"ControlPanel"
      anchors { top: controlBox.top; horizontalCenter: controlBox.horizontalCenter }
      width: parent.width-2
      height: parent.height-2
    }
  }
}
