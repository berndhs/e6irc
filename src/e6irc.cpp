#include "e6irc.h"
#include "cert-store.h"
#include <QDeclarativeItem>
#include "deliberate.h"

#include <QObjectList>

using namespace deliberate;


namespace egalite
{

int E6Irc::m_mentionedCount(0);

E6Irc::E6Irc (QWidget *parent, bool isPhone)
  :QDeclarativeView (parent),
   isProbablyPhone (isPhone),
   m_channelGroup (0),
   m_control (0),
   m_iconChanger (0)
{
  m_channelGroup = new IrcQmlChannelGroup (this, this);
  m_control = new IrcQmlControl (this, this, m_channelGroup);
  connect (engine(), SIGNAL (quit()), this, SLOT(allDone()));
  m_iconChanger = new QTimer(this);
  connect (m_iconChanger,SIGNAL(timeout()),this,SLOT(checkMention()));
  m_iconChanger->start(15000);
  connect (m_control,SIGNAL(seeUser()),this,SLOT(userLooking()));
  connect (m_channelGroup,SIGNAL(seeUser()),this,SLOT(userLooking()));
  connect (m_control,SIGNAL(exitPgm()),this,SLOT(allDone()));
  connect (m_channelGroup,SIGNAL(exitPgm()),this,SLOT(allDone()));
}

void
E6Irc::run (const QSize & desktopSize)
{
  CertStore::IF().Init();
  m_control->fillContext(isProbablyPhone);
  setSource (QUrl ("qrc:///qml/Main.qml"));
  m_channelGroup->Start();
  m_control->Run ();
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
    if (newsize.isEmpty()) {
      showMaximized();
      newsize = desktopSize;
      resize (newsize);
    } else {
      resize (newsize);
    }
    qDebug () << __PRETTY_FUNCTION__ << " resize to " << newsize
              << " result is " << size();
  }
  show ();
  Settings().sync ();
  objectCount = 0;
  fixCaps (qmlRoot);
  qDebug () << objectCount << " objects";
}

void
E6Irc::setIconNames(const QString &normalName, const QString &hiName)
{
  qDebug() << Q_FUNC_INFO << normalName << hiName;
  m_normalIcon = normalName;
  m_hiIcon = hiName;
  setWindowIcon(QIcon(m_normalIcon));
  m_usingHiIcon = false;
}

void
E6Irc::checkMention()
{
  int newMents =  m_control->mentionedCount();
  qDebug() << Q_FUNC_INFO << newMents;
  if (newMents != m_mentionedCount) {
    QString curIconName =  windowIcon().name();
    qDebug() << Q_FUNC_INFO << " change from " << curIconName;
    if (m_usingHiIcon) {
      setWindowIcon(QIcon(m_normalIcon));
    } else {
      setWindowIcon(QIcon(m_hiIcon));
    }
    m_usingHiIcon = !m_usingHiIcon;
    m_mentionedCount = newMents;
  }
  m_control->resetMentioned();
}

void E6Irc::userLooking()
{
  checkMention();
}

void
E6Irc::allDone ()
{
  QSize currentSize = size();
  qDebug () << __PRETTY_FUNCTION__ << " leaving " << currentSize;
  m_channelGroup->reportChannels (Settings());
  Settings().setValue ("sizes/e6irc",currentSize);
  Settings().sync();
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
          QDeclarativeItem * item = qobject_cast<QDeclarativeItem*> (root);
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
