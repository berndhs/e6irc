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
  Flickable {
    id: scrollBox
    width: mainBox.width
    height: mainBox.height
    contentWidth: mainBox.width
    contentHeight: scrollBoxContent.height
    clip: false
    boundsBehavior: Flickable.DragAndOvershootBounds
    
    Rectangle {
      id: scrollBoxContent
      width: mainBox.width
      height: 2*( nickGet.height + realNameGet.height 
                 + passGet.height + saveButton.heigt) 
              - mainBox.rowHeight
      GetString {
        id: nickGet
        objectName: "NickGet"
        color: mainBox.color
        width: mainBox.width
        radius: mainBox.radius
        anchors {
          top: scrollBoxContent.top; topMargin: 16
          horizontalCenter: scrollBoxContent.horizontalCenter
        }
        inputTextColor: "#000000"
        titleText: "New User Nick"
        text: ""
        inputBoxRadius: 0
        useCheckList: false
        suppressInitialCaps: true
        onIsDone: {
          focus = false
          realNameGet.takeFocus()
        }
        onTabHit: {
          console.log ("TAB in nick")
          focus = false
          realNameGet.takeFocus()
        }
        onCancelled: {
          mainBox.nevermind ()
        }
      }
      GetString {
        id: realNameGet
        objectName: "RealNameGet"
        color: mainBox.color
        width: mainBox.width
        anchors {
          top: nickGet.bottom
          horizontalCenter: scrollBoxContent.horizontalCenter
        }
        inputTextColor: "#000000"
        titleText: "Real Name"
        text: ""
        inputBoxRadius: 0
        radius: 0
        useCheckList: false
        suppressInitialCaps: false
        onIsDone: {
          focus = false
          passGet.takeFocus()
        }
        onTabHit: {
          console.log ("TAB in real name")
          focus = false
          passGet.takeFocus()
        }
        onCancelled: {
          mainBox.nevermind ()
        }
        onActiveFocusChanged: {
          console.log ("real name active focus " + activeFocus)
        }
      }
      
      GetString {
        id: passGet
        objectName:"PassGet"
        color: mainBox.color
        width: mainBox.width
        anchors {
          top: realNameGet.bottom
          horizontalCenter: scrollBoxContent.horizontalCenter
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
        suppressInitialCaps: true
        onIsDone: {
          focus: false
        }
        onTabHit: {
          focus = false
        }
        onCancelled: {
          mainBox.nevermind ()
        }
      }
      
      ChoiceButton {
        id: saveButton
        width: mainBox.width
        height: mainBox.rowHeight
        labelText:qsTr ("Save") 
        anchors {
          top: passGet.bottom
          horizontalCenter: scrollBoxContent.horizontalCenter
        }
        
        onClicked: {
          checkSave.isChecked = true
          mainBox.haveNewUser (nickGet.text, realNameGet.text, 
                               passGet.text, checkSave.isChecked)
        }
      }
    }
  }
  
}
