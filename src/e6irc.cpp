#include "e6irc.h"
#include "cert-store.h"
#include <QDeclarativeItem>
#include "deliberate.h"

using namespace deliberate;


namespace egalite
{

E6Irc::E6Irc (QWidget *parent, bool isPhone)
  :QDeclarativeView (parent),
   isProbablyPhone (isPhone),
   channelGroup (0),
   control (0)
{
  channelGroup = new IrcQmlChannelGroup (this, this);
  control = new IrcQmlControl (this, this, channelGroup);
  connect (engine(), SIGNAL (quit()), this, SLOT(allDone()));
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
  if (!isFullScreen()) {
    QSize defaultSize = size();
    QSize newsize = Settings().value ("sizes/e6irc", defaultSize).toSize();
    resize (newsize);
    qDebug () << __PRETTY_FUNCTION__ << " resize to " << newsize
              << " result is " << size();
  }
  Settings().sync ();
}

void
E6Irc::allDone ()
{
  QSize currentSize = size();
  qDebug () << __PRETTY_FUNCTION__ << " leaving " << currentSize;
  Settings().setValue ("sizes/e6irc",currentSize);
  Settings().sync();
  emit quit ();
}

}
