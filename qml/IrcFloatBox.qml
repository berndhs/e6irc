
import QtQuick 2.5

/** \brief Container for a single floating IRC channel */

Rectangle {
  id: ircFloat
  property real channelTopMargin: 0
  height: 400
  width: 600
  x: 0
  y: 0
  color: "#f2f2f5"

  property alias floatName: floatingChannel.objectName
  
  signal hideMe ()
  signal dockMe ()
  
  IrcChannelBox {
    id: floatingChannel
    width: parent.width
    visibleHeight: parent.height
    anchors { top: parent.top; topMargin: 0 }
  }

  Component.onCompleted: {
    console.log ("have float box")
  }
}
