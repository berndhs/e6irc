
PROJECT = e6irc
TARGET = e6irc

include ("e6irc-common.pri")

QMAKE_CXXFLAGS += -DDELIBERATE_LINUX=1


unix: {
    desktopfile.files = linux/e6irc.desktop
    desktopfile.path = $$(INSTALL_ROOT)/usr/share/applications
    INSTALLS += desktopfile

    icon.files = icons/64/e6irc.png
    icon.path = $$(INSTALL_ROOT)/usr/share/pixmaps
    INSTALLS += icon

    target.path = $$(INSTALL_ROOT)/usr/bin
    INSTALLS += target
}
