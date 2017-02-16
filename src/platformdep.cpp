#include "platformdep.h"
#include "deliberate.h"
#include <QMessageBox>
#include "main.h"
#include <QVariant>
#include <QDebug>

namespace egalite {

  using namespace deliberate;

PlatformDep::PlatformDep(QObject *parent)
  : QObject(parent),
    theRoot(Q_NULLPTR),
    pixelRate(1.0),
    widthPixels(100),
    heightPixels(100),
    m_os(QString("dunno")),
    m_stdRowHeight(32)
{

}

void
PlatformDep::setRoot(QObject *rootObj)
{
  qDebug() << Q_FUNC_INFO << rootObj;
  theRoot = rootObj;
  if (theRoot) {
    m_os = theRoot->property("theOS").toString();
    if (m_os.isEmpty()) {
      m_os = "we are not sure"; // wild guess
    }
    pixelRate = theRoot->property ("pixelRate").toDouble();
    widthPixels = theRoot->property ("screenWidth").toInt();
    heightPixels = theRoot->property("screenHeight").toInt();
    m_stdRowHeight = 3 * pixelRate;
    QList<QObject*> kidList = findChildren<QObject*>("ChannelMenu");
    qDebug() << "Channel menu list" << kidList;
  }
  QString msg;
  msg.append(QString("Root at 0x%1").arg(quintptr(theRoot),0,16));
  msg.append("\nproperties:");
  msg.append(QString("OS: %1").arg(m_os));
  msg.append(QString("\n\tpixelRate \t%1").arg(pixelRate));
  msg.append(QString("\n\twidthPixels \t%1").arg(widthPixels));
  msg.append(QString("\n\theightPixels \t%1").arg(heightPixels));
  msg.append(QString("\n\tstdRowHeight\t%1").arg(m_stdRowHeight));
  QMessageBox::warning(0,"Root Info",msg);
  qDebug () << Q_FUNC_INFO << __LINE__ << msg;
  if (theRoot == Q_NULLPTR) {
    abort();
  }
  m_stdRowHeight = 32 * pixelRate;
  Settings().setValue("platform/os",QVariant(m_os));
  Settings().setValue("platform/pixelRate",QVariant(pixelRate));
  Settings().setValue("platform/stdRowHeight",QVariant(m_stdRowHeight));
  Settings().sync();
}

qreal
PlatformDep::pixelSize(int mm)
{
  return mm * pixelRate;
}

void PlatformDep::iAmHere(QObject *obj)
{
  qDebug() << Q_FUNC_INFO << obj;
  QMessageBox::warning (0,QString("QML warning"),QString ("from object 0x%1").arg(quintptr(obj),0,16));
}

void PlatformDep::blow()
{
  qDebug() << "Exiting from QML (probably)";
  abort();
}

int PlatformDep::stdRowHeight() const
{
  return m_stdRowHeight;
}

} // namespace
