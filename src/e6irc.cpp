#include "e6irc.h"
#include "cert-store.h"
#include <QQuickItem>
#include "deliberate.h"

#include <QObjectList>

using namespace deliberate;


namespace egalite
{

E6Irc::E6Irc (QWindow *parent, bool isPhone)
  :QQuickView (parent),
   isProbablyPhone (isPhone),
   channelGroup (0),
   control (0)
{
  channelGroup = new IrcQmlChannelGroup (this, this);
  control = new IrcQmlControl (this, this, channelGroup);
  connect (engine(), SIGNAL (quit()), this, SLOT(allDone()));
  qDebug() << Q_FUNC_INFO << __LINE__;
}

void
E6Irc::run (const QSize & desktopSize)
{
  qDebug() << Q_FUNC_INFO << __LINE__;
  CertStore::IF().Init();
  qDebug() << Q_FUNC_INFO << __LINE__;
  control->fillContext(isProbablyPhone);
  qDebug() << Q_FUNC_INFO << __LINE__;
  setSource (QUrl ("qrc:///qml/Main.qml"));
  qDebug() << Q_FUNC_INFO << __LINE__;
  channelGroup->Start();
  qDebug() << Q_FUNC_INFO << __LINE__;
  control->Run ();
  qDebug() << Q_FUNC_INFO << __LINE__;
  QObject * qmlRoot = rootObject();
  QQuickItem * qmlItem = qobject_cast<QQuickItem*> (qmlRoot);
  QObject * osInfo = qmlRoot->findChild<QObject*>("OsInfo");
  bool android(false);
  if (osInfo) {
    qDebug() << Q_FUNC_INFO << "os is " << osInfo->property("theOS");
    if (osInfo->property("theOS").toString() == QString("android")) {
      isProbablyPhone = true;
      android = true;
    }
  }
  qDebug() << Q_FUNC_INFO << __LINE__;
  if (qmlItem) {
    qDebug () << __PRETTY_FUNCTION__ << " phone ? " << isProbablyPhone;
    QMetaObject::invokeMethod (qmlItem, "phoneSettings",
      Q_ARG (QVariant, isProbablyPhone));
    qDebug() << Q_FUNC_INFO << __LINE__;
  }
  qDebug() << Q_FUNC_INFO << __LINE__;
  QSize defaultSize = size();
  qDebug() << Q_FUNC_INFO << __LINE__;
  QSize newsize = QSize(500,300);// Settings().value ("ssizes/e6irc", defaultSize).toSize();
  qDebug () << Q_FUNC_INFO << "new size" << newsize << "default" << defaultSize;
//  abort();
  if (android && isProbablyPhone) {
    qDebug() << Q_FUNC_INFO << __LINE__;
    if (newsize.isEmpty()) {
//      showMaximized();
//      showFullScreen();
      qDebug() << Q_FUNC_INFO << __LINE__;
      newsize = desktopSize;
      qDebug() << Q_FUNC_INFO << __LINE__;
      resize (newsize);
    } else {
        qDebug() << Q_FUNC_INFO << __LINE__;
      resize (newsize);
    }
    qDebug() << Q_FUNC_INFO << __LINE__;
    qDebug () << __PRETTY_FUNCTION__ << " resize to " << newsize
              << " result is " << size();
  }
  qDebug() << Q_FUNC_INFO << __LINE__;
  show ();
  qDebug() << Q_FUNC_INFO << __LINE__;
  Settings().sync ();
  qDebug() << Q_FUNC_INFO << __LINE__;
  objectCount = 0;
  fixCaps (qmlRoot);
  qDebug() << Q_FUNC_INFO << __LINE__;
  qDebug() << Q_FUNC_INFO << __LINE__;
  qDebug () << objectCount << " objects";
}

void
E6Irc::allDone ()
{
  QSize currentSize = size();
  qDebug () << __PRETTY_FUNCTION__ << " leaving " << currentSize;
  Settings().setValue ("sizes/e6irc",currentSize);
  Settings().sync();
  qDebug() << Q_FUNC_INFO << "did sync settings";
  emit quit ();
}

void
E6Irc::fixCaps (QObject * root)
{
  if (root) {
    objectCount++;
    QVariant suppressVar = root->property ("noInitialCaps");
    if (suppressVar.isValid()) {
      qDebug () << "found property on " << root ;
      qDebug () << suppressVar;
      if (suppressVar.type() == QVariant::Bool) {
        bool suppress = suppressVar.toBool();
        if (suppress) {
          QWidget * item = qobject_cast<QWidget*> (root);
          if (item) {
            item->setInputMethodHints (Qt::ImhNoAutoUppercase);
          }
        }
      }
    }
    QObjectList children = root->children();
    for (int i=0; i<children.count(); i++) {
      fixCaps (children.at(i));
    }
  }
}

} // namespace
