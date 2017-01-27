#ifndef FILEINIT_H
#define FILEINIT_H

#include <QObject>
#include <QString>
#include <QProcess>
#include <QTimer>

namespace egalite {

class FileInit : public QObject
{
  Q_OBJECT
public:
  explicit FileInit(QObject *parent = 0);

  void checkInitialized();
  QString qrcContentPath();
  QString writablePath();

signals:

  void movedAddressingTo (const QString & fileIsAt );

public slots:

  void doneCopy (int exitCode, QProcess::ExitStatus exitStatus);
  void badness (QProcess::ProcessError err);
  void checkProcess ();

private:
  QString qrcPath();

  int copyFile (const QString dest, const QString source); // return bytes copied

  QString     destFilepath;
  QProcess   *fileCopier;
  QTimer     *checkCopy;
};

} // namespace
#endif // FILEINIT_H
