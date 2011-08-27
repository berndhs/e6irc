import QtQuick 1.0

Rectangle {
  id: mainBox
  width: 400
  height: 400
  color: "blue"
  radius: 8
  property real rowHeight: 32
  
  signal haveNewUser (string nick, string realName, string pass, bool save)
  signal nevermind ()

  VisualItemModel {
    id: saveOptionsModel
    property real itemHeight: 40
    property real totalHeight: itemHeight * count
    CheckItem {
      id: checkSave
      text: "Save"
      imageHeight: 32
      height:mainBox.rowHeight * 1.25
      font.bold: isChecked
    }
  }

  GetString {
    id: nickGet
    color: mainBox.color
    width: mainBox.width
    anchors {
      top: mainBox.top; topMargin: 16
      horizontalCenter: mainBox.horizontalCenter
    }
    inputTextColor: "#000000"
    titleText: "New User Nick"
    text: ""
    inputBoxRadius: 0
    radius: 0
    useCheckList: false
    onIsDone: {
      mainBox.haveNewUser (nickGet.text, realNameGet.text, 
                           passGet.text, checkSave.isChecked)
    }
    onTabHit: {
      focus = false
    }
    onEscapeHit: {
      mainBox.nevermind ()
    }
  }
  GetString {
    id: realNameGet
    color: mainBox.color
    width: mainBox.width
    anchors {
      top: nickGet.bottom
      horizontalCenter: mainBox.horizontalCenter
    }
    inputTextColor: "#000000"
    titleText: "Real Name"
    text: ""
    inputBoxRadius: 0
    radius: 0
    useCheckList: false
    onIsDone: {
      mainBox.haveNewUser (nickGet.text, realNameGet.text, 
                           passGet.text, checkSave.isChecked)
    }
    onTabHit: {
      focus = false
    }
    onEscapeHit: {
      mainBox.nevermind ()
    }
  }

  GetString {
    id: passGet
    color: mainBox.color
    width: mainBox.width
    anchors {
      top: realNameGet.bottom
      horizontalCenter: mainBox.horizontalCenter
    }
    inputTextColor: "#000000"
    titleText: "Password"
    text: ""
    echoModus: TextInput.PasswordEchoOnEdit // TextInput.PasswordEchoOnEdit
    inputBoxRadius: 0
    radius: 0
    useCheckList: true
    checkListModel: saveOptionsModel
    checkListColor: color
    checkListHeight: 1.5* mainBox.rowHeight
    onIsDone: {
      mainBox.haveNewUser (nickGet.text, realNameGet.text, 
                           passGet.text, checkSave.isChecked)
    }
    onTabHit: {
      focus = false
    }
    onEscapeHit: {
      mainBox.nevermind ()
    }
  }
  
}
