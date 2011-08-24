#include "e6irc.h"
#include "cert-store.h"

namespace egalite
{

E6Irc::E6Irc (QWidget *parent)
  :QDeclarativeView (parent),
   control (0)
{
  control = new IrcQmlControl (this,this);
}

void
E6Irc::run ()
{
  CertStore::IF().Init();
  control->fillContext();
  setSource (QUrl ("qrc:///qml/Main.qml"));
  control->Run ();
}

}
