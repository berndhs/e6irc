import QtQuick 2.5
import QtQml 2.2
import QtQuick.Window 2.2

import moui.geuzen.utils.static 1.0

Rectangle {
    id: mainBox
    objectName: "MainBox";
    color:  "yellow"
    width: 600; height: 400;
    property real mainWidth: width
    property real mainHeight: height
    property real restMainHeight: mainHeight
    property real standardRowHeight: 32
    property bool showControl: true

    /* the next few properties are needed for C++ to know things about the display */
    property string theOS: Qt.platform.os;
    property real mmPerPix: Screen.devicePixelRatio;
    property int  screenWidth: Screen.desktopAvailableWidth;
    property int  screenHeight: Screen.desktopAvailableHeight;

    Item {
        id: devInfo;
        objectName: "OsInfo";
        property string theOS: Qt.platform.os;
        Component.onCompleted: {
            console.log("have============================= "+objectName+" "+theOS)
            console.log ("platform is here "+Qt.platform);
        }
    }

    function phoneSettings (isPhone) {
        isProbablyPhone = isPhone
        standardRowHeight = 32 // isPhone ? 64 : 32
        console.log ("changed standard row height to " + standardRowHeight)
        return standardRowHeight
    }

    IrcChannelGroup {
        id: channelGroup
        objectName:"ChannelGroup"
        width: mainWidth
        height: restMainHeight
        standardRowHeight: mainBox.standardRowHeight
        anchors { top: minBox.top; horizontalCenter: mainBox.horizontalCenter }

        visible: !mainBox.showControl
        onShowControl: {
            mainBox.showControl = true
        }
    }
    Rectangle {
        id: controlBox
        color: "#ff77ee"
        width: mainWidth
        height: restMainHeight
        visible: mainBox.showControl
        anchors {top: mainBox.top; horizontalCenter: mainBox.horizontalCenter }
        IrcControl {
            id: ircControl
            objectName:"ControlPanel"
            anchors { 
                top: controlBox.top;
                horizontalCenter: controlBox.horizontalCenter ;
            }
            width: controlBox.width-2
            height: controlBox.height-2
            buttonHeight: mainBox.standardRowHeight
            standardRowHeight: mainBox.standardRowHeight
            function showControl () {
                mainBox.showControl = true
            }
            onAddedChannel: {
                mainBox.showControl = false
            }
            onHideMe: {
                mainBox.showControl = false
            }
        }
    }


}
