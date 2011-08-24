#include "e6irc.h"
#include "cert-store.h"
#include <QDeclarativeItem>

namespace egalite
{

E6Irc::E6Irc (QWidget *parent, bool isPhone)
  :QDeclarativeView (parent),
   isProbablyPhone (isPhone),
   channelGroup (0),
   control (0)
{
  channelGroup = new IrcQmlChannelGroup (this, this);
  control = new IrcQmlControl (this,this, channelGroup);
}

void
E6Irc::run ()
{
  CertStore::IF().Init();
  control->fillContext(isProbablyPhone);
  setSource (QUrl ("qrc:///qml/Main.qml"));
  channelGroup->Start();
  control->Run ();
  QObject * qmlRoot = rootObject();
  QDeclarativeItem * qmlItem = qobject_cast<QDeclarativeItem*> (qmlRoot);
  if (qmlItem) {
    qDebug () << __PRETTY_FUNCTION__ << " phone ? " << isProbablyPhone;
    QMetaObject::invokeMethod (qmlItem, "phoneSettings",
      Q_ARG (QVariant, isProbablyPhone));
  }
}

}
