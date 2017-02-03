#include "platformdep.h"
#include <QMessageBox>
#include "main.h"
#include <QVariant>
#include <QDebug>

namespace egalite {

PlatformDep::PlatformDep(QObject *parent)
  : QObject(parent),
    theRoot(Q_NULLPTR),
    os(QString("dunno")),
    mmPerPix(1.0),
    widthPixels(100),
    heightPixels(100)
{

}

void
PlatformDep::setRoot(QObject *rootObj)
{
  qDebug() << Q_FUNC_INFO << rootObj;
  theRoot = rootObj;
  if (theRoot) {
    os = theRoot->property("theOS").toString();
    if (os.isEmpty()) {
      os = "we are not sure"; // wild guess
    }
    mmPerPix = theRoot->property ("mmPerPix").toDouble();
    widthPixels = theRoot->property ("screenWidth").toInt();
    heightPixels = theRoot->property("screenHeight").toInt();
    QList<QObject*> kidList = findChildren<QObject*>("ChannelMenu");
    qDebug() << "Channel menu list" << kidList;
  }
  QString msg;
  msg.append(QString("Root at 0x%1").arg(quintptr(theRoot),0,16));
  msg.append("\nproperties:");
  msg.append(QString("OS: %1").arg(os));
  msg.append(QString("\n\tmmPerPix \t%1").arg(mmPerPix));
  msg.append(QString("\n\twidthPixels \t%1").arg(widthPixels));
  msg.append(QString("\n\theightPixels \t%1").arg(heightPixels));
//  QMessageBox::warning(0,"Root Info",msg);
  qDebug () << Q_FUNC_INFO << __LINE__ << msg;
  if (theRoot == Q_NULLPTR) {
    abort();
  }
}

qreal
PlatformDep::pixelSize(int mm)
{
  return mm * mmPerPix;
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

} // namespace
