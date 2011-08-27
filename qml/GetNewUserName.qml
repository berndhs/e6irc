import QtQuick 1.0


/****************************************************************
 * This file is distributed under the following license:
 *
 * Copyright (C) 2011, Bernd Stramm
 *
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 2
 *  of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, 
 *  Boston, MA  02110-1301, USA.
 ****************************************************************/


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
