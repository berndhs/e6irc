import QtQuick 2.5
import QtQml 2.2
import QtQuick.Window 2.2

import moui.geuzen.utils.static 1.0

Rectangle {
  id: mainBox
  x: 0
  y: 0
  rotation: 0
  color:  "red"
  width: 400; height: 400;
  property real mainWidth: width
  property real mainHeight: height
  property real restMainHeight: mainHeight
  property real standardRowHeight: 32
  property bool showControl: true

//  Item {
//      id: devInfo;
//      objectName: "OsInfo";
//      property string theOS: Screen.os;
//      Component.onCompleted: {
//          console.log("have============================= "+objectName+" "+theOS)
//      }
//  }

//  function phoneSettings (isPhone) {
//    isProbablyPhone = isPhone
//    standardRowHeight = isPhone ? 64 : 32
//    console.log ("changed standard row height to " + standardRowHeight)
//    return standardRowHeight
//  }
  
//  IrcChannelGroup {
//    id: channelGroup
//    objectName:"ChannelGroup"
//    width: mainWidth
//    height: restMainHeight
//    standardRowHeight: mainBox.standardRowHeight
//    anchors { top: mainBox.top; horizontalCenter: mainBox.horizontalCenter }
    
//    visible: !mainBox.showControl
//    onShowControl: {
//      mainBox.showControl = true
//    }
//  }
//  Rectangle {
//    id: controlBox
//    color: "#ff77ee"
//    width: mainWidth
//    height: restMainHeight
//    visible: mainBox.showControl
//    anchors {top: mainBox.top; horizontalCenter: mainBox.horizontalCenter }

//    IrcControl {
//      id: ircControl
//      objectName:"ControlPanel"
//      anchors { top: controlBox.top; horizontalCenter: controlBox.horizontalCenter }
//      width: parent.width-2
//      height: parent.height-2
//      buttonHeight: mainBox.standardRowHeight
//      standardRowHeight: mainBox.standardRowHeight
//      function showControl () {
//        mainBox.showControl = true
//      }
//      onAddedChannel: {
//        mainBox.showControl = false
//      }
//      onHideMe: {
//        mainBox.showControl = false
//      }
//    }
//  }
  
}
