#include "fileinit.h"

#include <QDebug>
#include <QStandardPaths>
#include <QFileInfo>
#include <QDir>
#include <QFile>
#include <QByteArray>
#include "deliberate.h"

using namespace deliberate;

namespace egalite {

FileInit::FileInit(QObject *parent) : QObject(parent)
{

}

void
FileInit::checkInitialized()
{
 qDebug() << Q_FUNC_INFO;
 QFileInfo addrFile (writablePath());
 if (!addrFile.exists() || addrFile.size() == 0) {
   QFile target(addrFile.fileName());
   target.open(QFile::WriteOnly);
   QFile source(qrcPath());
   source.open(QFile::ReadOnly);
   QByteArray content = source.readAll();
   target.write(content.data(),content.size());


 }
 emit movedAddressingTo(addrFile.absoluteFilePath());
}

QString
FileInit::writablePath()
{
  QString dbFileName =  QStandardPaths::writableLocation
                (QStandardPaths::AppDataLocation)
                + QDir::separator()
                + QString ("addressing.sql");
  dbFileName = Settings().value ("files/addressing",dbFileName).toString();
  destFilepath = dbFileName;
  return destFilepath;
}

QString
FileInit::qrcPath()
{
  return QString ("qrc:///preload/addressing.sql");
}

}
