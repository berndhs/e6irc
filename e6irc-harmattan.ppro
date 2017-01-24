
PROJECT = e6irc
TARGET = e6irc

include ("e6irc-common.pri")

QMAKE_CXXFLAGS += -DDELIBERATE_LINUX_HARMATTAN=1


OTHER_FILES += \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog \
    qml/KnownServerList.qml \
    qml/IrcTestBox.qml \
    qml/IrcFloatBox.qml \
    qml/IrcControl.qml \
    qml/IrcChannelGroup.qml \
    qml/IrcChannelBox.qml \
    qml/DropMenu.qml \
    qml/ChoiceButton.qml \
    qml/ActiveServerList.qml \
    qml/Main.qml \
    e6irc.png
    

unix:!symbian:!maemo5 {
    desktopfile.files += harmattan/e6irc.desktop
    desktopfile.path = /usr/share/applications
    INSTALLS += desktopfile

    icon.files = icons/64/e6irc.png
    icon.path = /usr/share/icons/hicolor/64x64/apps
    INSTALLS += icon

    target.path = /opt/e6irc/bin
    INSTALLS += target
}

