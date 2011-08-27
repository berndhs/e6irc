import QtQuick 1.0

Rectangle {
  id: mainBox
  width: 400
  height: 400
  color: "blue"
  opacity: 0.95
  radius: 8
  property real rowHeight: 32
  property alias itemHeight: checkOptions.itemHeight

  signal haveNewServer (string name, bool save)
  signal nevermind ()

  VisualItemModel {
    id: checkOptions
    property real itemHeight: 40
    property real totalHeight: itemHeight * count
    CheckItem {
      id: checkSave
      text: "Save"
      imageHeight: 32
      height:checkOptions.itemHeight
      font.bold: isChecked
    }
  }

  GetString {
    id: nameGet
    color: mainBox.color
    anchors.centerIn: mainBox
    inputTextColor: "#000000"
    titleText: "New Server"
    text: ""
    inputBoxRadius: 6
    radius: 12
    useCheckList: true
    checkListModel: checkOptions
    checkListColor: "transparent"
    checkListHeight: checkOptions.totalHeight
    onIsDone: {
      console.log ("input is done")
      console.log (" check height is " + checkListHeight)
      console.log (" input text is \"" + text + "\"")
      console.log (" check save " + checkSave.isChecked)
      mainBox.haveNewServer (text, checkSave.isChecked)
    }
    onEscapeHit: {
      mainBox.nevermind ()
    }
  }
}
