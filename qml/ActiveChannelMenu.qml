import QtQuick 2.0
import QtQuick.Controls 2.1

Rectangle {
    id: channelMenu;
    color: "blue";
    property real itemWidth: 100;
    property Item channelParent: NULL;
    function popup () {
        console.log ("ActiveChannelMenu popup" , channelMenuMenu);
        channelMenuMenu.open();
    }
    Image {
        id: menuImage;
        source: "qrc:///icon64.png";
        anchors.top: channelMenu.top;
        anchors.left: channelMenu.left;
        opacity: 1.0;
        MouseArea {
            anchors.fill: parent;
            onReleased: {
                menuImage.opacity = 0.5;
                channelMenuMenu.open();
            }
        }
    }
    property bool isShown;
    property int itemHeight;
    
    Component.onCompleted: {
        menuImage.visible = true;
        menuImage.opacity = 1.0;
    }


    Menu {
        id: channelMenuMenu;
        objectName: "ChannelMenu";

        title: "Ops"
        visible: true;
        signal toggleDfloat();
        MenuItem {
            text: "Nada";
            onTriggered: {
                console.log("nada");
            }
        }

        MenuItem {
            text: qsTr("Float/Dock");
            onTriggered: {
                channelParent.toggleFloat();
            }
        }
        MenuItem {
            text: cookedFlickBox.interactive ?
                      qsTr ("Stop Scroll") : qsTr ("Start Scroll");
            onTriggered: {
                channelParent.toggleScroll();
            }
        }
        MenuItem {
            text: qsTr("Leave Channel");
            onTriggered: {
                channelParent.wantPart();
            }
        }
        MenuItem {
            text: qsTr ("Show Control");
            onTriggered: {
                channelParent.showControl();
            }
        }
        MenuItem {
            text: qcTr ("Toggle Log");
            onTriggered: {
                channelParent.toggleLog();
            }
            MenuItem {
                text: qsTr("Leave Chat");
                onTriggered: {
                    Qt.quit();
                }
            }
        }
    }
}
