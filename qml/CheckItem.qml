import QtQuick 1.0

Rectangle {
  id: checkItem
  color: "transparent"
  height: Math.max (checkBox.height, checkText.height)
  width: checkBox.width + checkText.width + textIndent
  property bool isChecked: false
  property real textIndent: 8
  property string imageTrue: "/checked-yes.png"
  property string imageFalse: "/checked-no.png"
  property alias text: checkText.text
  property alias font: checkText.font
  property alias imageHeight: checkBox.height
  property alias imageWidth: checkBox.width
 
  
  Image {
    id: checkBox
    source: checkItem.isChecked ? checkItem.imageTrue :checkItem.imageFalse
    height: 64
    width: 64
    anchors {
      left: checkItem.left
      verticalCenter: checkItem.verticalCenter
    }
  }
  Text {
    id: checkText
    anchors {
      left: checkBox.right
      leftMargin: checkItem.textIndent
      verticalCenter: checkItem.verticalCenter
    }
    text: "Item Text"
  }
  MouseArea {
    anchors.fill: parent
      
    onClicked: {
      checkItem.isChecked = ! checkItem.isChecked
    }
  }
}