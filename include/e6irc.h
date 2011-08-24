#ifndef EGALITE_E6IRC_H
#define EGALITE_E6IRC_H

#include <QDeclarativeView>
#include "irc-qml-control.h"
#include "irc-qml-channel-group.h"

namespace egalite
{
class E6Irc : public QDeclarativeView
{
Q_OBJECT
public:

  E6Irc (QWidget *parent, bool isPhone);
  
  void run ();
  
private:

  bool                  isProbablyPhone;
  IrcQmlChannelGroup  * channelGroup;
  IrcQmlControl       * control; 
  
};

}

#endif // E6IRC_H
