import QtQuick 2.2
import QtQuick.Window 2.2

Rectangle {
    objectName: "BigMain";
    width: 200;
    height: 200;
    color: "lightblue";
    property string theOS: Screen.os;
    Text {
        anchors.centerIn: parent;
        text: Screen.os;
    }

}
