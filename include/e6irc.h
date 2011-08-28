#ifndef EGALITE_E6IRC_H
#define EGALITE_E6IRC_H

#include <QDeclarativeView>
#include <QSize>
#include "irc-qml-control.h"
#include "irc-qml-channel-group.h"

namespace egalite
{
class E6Irc : public QDeclarativeView
{
Q_OBJECT
public:

  E6Irc (QWidget *parent, bool isPhone);
  
  void run (const QSize & desktopSize);

private slots:

  void allDone ();

signals:

  void quit ();
  
private:

  void fixCaps (QObject * root);

  bool                  isProbablyPhone;
  IrcQmlChannelGroup  * channelGroup;
  IrcQmlControl       * control; 
  
};

}

#endif // E6IRC_H
