import QtQuick 2.2
import QtQuick.Window 2.2

Rectangle {
    id: bigBox;
    objectName: "LittleMain";
    width: 1000;
    height: 300;
    color: "lightgreen";
    property string theOS: Screen.os;
    Text {
        id: osText;
        anchors.centerIn: parent;
        text: Screen.os;
    }
    Text {
        id: fileText;
        anchors {
            horizontalCenter: parent.horizontalCenter;
            top: osText.bottom;
            topMargin: 10;
        }
        text: bigBox.objectName;
        MouseArea {
            anchors.fill: parent;
            onClicked: {
                Qt.quit()
            }
        }
    }

}
