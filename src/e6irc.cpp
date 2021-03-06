#include "e6irc.h"
#include "main.h"
#include "cert-store.h"
#include <QQuickItem>
#include <QQmlContext>
#include <QMessageBox>
#include "deliberate.h"

#include <QObjectList>

using namespace deliberate;


namespace egalite
{

E6Irc::E6Irc (QWindow *parent, bool isPhone)
  :QQuickView (parent),
   isProbablyPhone (false),
   channelGroup (0),
   control (0)
{
  platFormStuff = new PlatformDep (this);
  channelGroup = new IrcQmlChannelGroup (this, this);
  control = new IrcQmlControl (this, this, channelGroup);
  connect (engine(), SIGNAL (quit()), this, SLOT(allDone()));
  qDebug() << Q_FUNC_INFO << __LINE__;
}

void
E6Irc::run (const QSize & desktopSize)
{
  QSize theSize (desktopSize);
  if (desktopSize == QSize(0,0)) {
    theSize =Settings().value("sizes/e6irc",QSize(600,300)).toSize();
  }
  qDebug() << Q_FUNC_INFO << __LINE__ << theSize << desktopSize;
  resize(theSize);
  show();
//  QMessageBox::warning(0,QString("Look at debug lod"),QString("     look               "));
  control->LoadLists();
  qDebug() << Q_FUNC_INFO << __LINE__;
  setSource (QUrl ("qrc:///qml/Main.qml"));
  setResizeMode(SizeRootObjectToView);
  resize(theSize);
  qDebug() << Q_FUNC_INFO << __LINE__;
//  QMessageBox::warning(0,QString("Look at debug lod"),QString("     look               "));
  channelGroup->Start();
  qDebug() << Q_FUNC_INFO << __LINE__;
  control->Run ();
//  QMessageBox::warning(0,QString("Look at debug lod"),QString("     look               "));
  qDebug() << Q_FUNC_INFO << __LINE__;
  QObject * qmlRoot = rootObject();
  platFormStuff->setRoot(qmlRoot);
  QQmlContext *context = rootContext();
  if (context) {
    context->setContextProperty("cppPlatform",cppPlatform());
  }
  QQuickItem * qmlItem = qobject_cast<QQuickItem*> (qmlRoot);
  bool android(false);
  qDebug() << Q_FUNC_INFO << __LINE__ << "root" << qmlRoot;
  if (qmlRoot) {
     qDebug() << qmlRoot->objectName() << qmlRoot->property("theOS")  ;
     if (qmlRoot->property("theOS").toString() == QString("android"))
       android = true;
  }
  egalite::globalAndroid = android;
  qDebug() << Q_FUNC_INFO << __LINE__ << "android" << android;
  isProbablyPhone = android;
  qDebug() << Q_FUNC_INFO << __LINE__;
  control->fillContext(isProbablyPhone);
  if (qmlItem) {
    qDebug () << __PRETTY_FUNCTION__ << " phone ? " << isProbablyPhone;
    QMetaObject::invokeMethod (qmlItem, "phoneSettings",
      Q_ARG (QVariant, android));
    qDebug() << Q_FUNC_INFO << __LINE__;
  }
  qDebug() << Q_FUNC_INFO << __LINE__ << android;
  if (android) {
    showFullScreen();
  } else {
    show ();
  }
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
  CertStore::IF().quit();
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
