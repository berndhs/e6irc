
TEMPALTE = app
QT += core gui widgets
QT += quick
QT += sql
QT += network
QT += multimedia multimediawidgets
QT += sensors


RESOURCES += \
    e6irc.qrc

QMAKE_CXXFLAGS = -std=c++11

MOC_DIR = tmp/moc
RCC_DIR = tmp/rcc
OBJECTS_DIR = tmp/obj

INCLUDEPATH += ./include

HEADERS = \
    include/irc-abstract-channel.h \
    include/irc-active-server-model.h \
    include/irc-ctcp.h \
    include/irc-float.h \
    include/irc-known-server-model.h \
    include/irc-nick-edit.h \
    include/irc-qml-channel-group.h \
    include/irc-qml-control.h \
    include/irc-qml-sock-static.h \
    include/irc-socket.h \
    include/version.h \
    include/name-list-model.h \
    include/html-mangle.h \
    include/orientation.h \
    include/cert-store.h \
    include/dchat-magic.h \
    include/qml-text-browser.h \
    include/deliberate.h \
    include/e6irc.h

SOURCES = \
    src/irc-abstract-channel.cpp \
    src/irc-active-server-model.cpp \
    src/irc-ctcp.cpp \
    src/irc-float.cpp \
    src/irc-known-server-model.cpp \
    src/irc-nick-edit.cpp \
    src/irc-qml-channel-group.cpp \
    src/irc-qml-control.cpp \
    src/irc-qml-sock-static.cpp \
    src/irc-socket.cpp \
    src/version.cpp \
    src/orientation.cpp \
    src/name-list-model.cpp \
    src/main.cpp \
    src/cert-store.cpp \
    src/qml-text-browser.cpp \
    src/deliberate.cpp \
    src/html-mangle.cpp \
    src/dchat-magic.cpp \
    src/e6irc.cpp

OTHER_FILES += \
    qml/Main.qml \
    qml/KnownServerList.qml \
    qml/IrcTestBox.qml \
    qml/IrcFloatBox.qml \
    qml/IrcControl.qml \
    qml/IrcChannelGroup.qml \
    qml/IrcChannelBox.qml \
    qml/DropMenu.qml \
    qml/ChoiceButton.qml \
    qml/ActiveServerList.qml
