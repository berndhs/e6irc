#ifndef EGALITE_E6IRC_H
#define EGALITE_E6IRC_H

#include <QDeclarativeView>
#include "irc-qml-control.h"

namespace egalite
{
class E6Irc : public QDeclarativeView
{
Q_OBJECT
public:

  E6Irc (QWidget *parent=0);
  
  void run ();
  
private:

 IrcQmlControl *control; 
  
};

}

#endif // E6IRC_H
