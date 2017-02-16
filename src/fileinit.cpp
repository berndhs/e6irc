#include "fileinit.h"

#include <QDebug>
#include <QStandardPaths>
#include <QFileInfo>
#include <QDir>
#include <QFile>
#include <QByteArray>
#include <QMessageBox>
#include "deliberate.h"

using namespace deliberate;

namespace egalite {

FileInit::FileInit(QObject *parent) : QObject(parent),
  fileCopier(Q_NULLPTR)
{
  fileCopier = new QProcess(this);
  checkCopy = new QTimer(this);
  connect (checkCopy,SIGNAL(timeout()),this,SLOT(checkProcess()));
  connect(fileCopier,SIGNAL(finished(int,QProcess::ExitStatus)),
         this,SLOT(doneCopy(int,QProcess::ExitStatus)));
  connect(fileCopier,SIGNAL(errorOccurred(QProcess::ProcessError)),
          this,SLOT(badness(QProcess::ProcessError)));
}

void
FileInit::checkInitialized()
{
  qDebug() << Q_FUNC_INFO;
  QFileInfo addrFile (writablePath());
  abort();
  if (!addrFile.exists() || addrFile.size() == 0) {
//    QFileInfo source(qrcPath());
//    QStringList args;
//    args << qrcPath();
//    args << addrFile.absoluteFilePath();
//    QMessageBox::StandardButton wantTo =
//       QMessageBox::warning(Q_NULLPTR,QString("Copying datgabase"),args.join("\tto\n"));
//    if (wantTo == QMessageBox::Ok) {
//      QFile::copy (qrcPath(),addrFile.canonicalFilePath());
////      fileCopier->start(QString("/bin/cp"),args);
////      copyFile (addrFile.absoluteFilePath(),qrcPath());
//      emit movedAddressingTo(addrFile.absoluteFilePath());
//    }
////    qDebug() << fileCopier->systemEnvironment();
////    qDebug() << fileCopier->state();
////    checkCopy->start(1000);
////      abort();
  }
}

void FileInit::doneCopy(int exitCode, QProcess::ExitStatus exitStatus)
{
  qDebug () << Q_FUNC_INFO << exitCode << exitStatus;
  if (exitCode != 0) {
    qDebug() << fileCopier->program();
    qDebug() << fileCopier->arguments();
    abort();
  }
  QFileInfo addrFile (writablePath());
  if (addrFile.exists() && addrFile.size() > 0) {
    emit movedAddressingTo(addrFile.absoluteFilePath());
  }
//  abort();
}

void FileInit::badness(QProcess::ProcessError err)
{
  qDebug() << Q_FUNC_INFO << err;
  QByteArray errOutput = fileCopier->readAllStandardError();
  QByteArray stdOutput = fileCopier->readAllStandardOutput();
  qDebug () << Q_FUNC_INFO << errOutput;
  qDebug() << Q_FUNC_INFO << stdOutput;
  QMessageBox::critical(0,QString("Fatal"),QString(errOutput) + "\n\t" + QString(stdOutput));
  abort();
}

void FileInit::checkProcess()
{
  qDebug() << Q_FUNC_INFO << fileCopier->state();
  QByteArray err = fileCopier->readAllStandardError();
  QByteArray out = fileCopier->readAllStandardOutput();
  qDebug () << err << out;
  checkCopy->stop();
//  QMessageBox::information(0,QString("Status"),QString(err)+"\n"+QString(out));
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
  return QString (":/preload/addressing.sql");
}

QString
FileInit::qrcContentPath()
{
  return QString (":/dbcontent.txt");
}

int FileInit::copyFile(const QString dest, const QString source)
{
  QFile src (source);
  QFile target (dest);
  QFileInfo srcInfo (src);
  QFileInfo tgtInfo (target);
  src.open(QFile::ReadOnly);
  int nBytes = src.size();
  target.open(QFile::WriteOnly);
  int oneK = 1024;
  int numKs = nBytes / oneK;
  int numLeft = nBytes % oneK;
  int totalWrote = 0;
//  QMessageBox::warning(0,QString ("Copy db file"),QString ("to %1\nbytes %2 from %3")
//                       .arg(target.fileName()).arg(nBytes).arg(srcInfo.size()));
  for (int i=0; i<numKs; ++i) {
    QByteArray bytes = src.read(oneK);
    int wrote = target.write(bytes);
    if (wrote != oneK) {
      QMessageBox::critical(0,QString("Did not write all"),
                            QString("%1 instead of %2").arg(wrote).arg(oneK));
      abort();
    }
    totalWrote += wrote;
  }
  QByteArray bytes = src.read(numLeft);
  int wrote = target.write(bytes);
  src.close();
  int nWritten = target.size();
  totalWrote += wrote;
  target.close();
  QMessageBox::critical(0,QString("Fatal: Copy no good"),
                        QString ("%1 source %2 target or %3")
                        .arg(nBytes)
                        .arg(nWritten)
                        .arg(totalWrote));
  if (nBytes != nWritten) {
    QMessageBox::critical(0,QString("Fatal: Copy no good"),
                          QString ("%1 source %2 target").arg(nBytes).arg(nWritten));
    abort();
  }
  return nWritten;
}

}
