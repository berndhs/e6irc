#ifndef EGALITE_E6IRC_H
#define EGALITE_E6IRC_H

#include <QQuickView>
#include <QSize>
#include "irc-qml-control.h"
#include "irc-qml-channel-group.h"
#include "platformdep.h"

namespace egalite
{
class E6Irc : public QQuickView
{
Q_OBJECT
public:

  E6Irc (QWindow *parent, bool isPhone);
  
public slots:

  void run (const QSize & desktopSize = QSize(600,300));

private slots:

  void allDone ();

signals:

  void quit ();
  
private:

  void fixCaps (QObject * root);

  PlatformDep         * platFormStuff;
  bool                  isProbablyPhone;
  IrcQmlChannelGroup  * channelGroup;
  IrcQmlControl       * control; 

  int                   objectCount;
  
};

}

#endif // E6IRC_H
