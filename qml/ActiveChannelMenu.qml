import QtQuick 2.0
import QtQuick.Controls 2.1

Rectangle {
    id: channelMenu;
    color: "beige";
    property real itemWidth: 100;
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
                menuImage.visible = false;
            }
        }
    }
    property bool isShown;
    property int itemHeight;
    
    Component.onCompleted: {
        menuImage.visible = true;
    }


    Menu {
        id: channelMenuMenu;
        objectName: "ChannelMenu";
        Component.onCompleted: {
            open();
            console.log ("have channel menu at ",channelMenu);
        }

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
                channelBox.toggleFloat();
            }
        }
        MenuItem {
            text: cookedFlickBox.interactive ?
                      qsTr (" Stop Scroll ") : qsTr (" Start Scroll ");
            onTriggered: {
                cookedFlickBox.interactive = !cookedFlickBox.interactive;
            }
        }
        MenuItem {
            text: qsTr("  Leave Channel  ");
            onTriggered: {
                channelBox.wantPart();
            }
        }
        MenuItem {
            text: qsTr (" Show Control  ");
            onTriggered: {
                channelBox.showControl();
            }
        }
        MenuItem {
            text: qsTr("Leave Chat");
            onTriggered: {
                Qt.quit();
            }
        }

    }
}
