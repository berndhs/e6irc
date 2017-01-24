#ifndef FILEINIT_H
#define FILEINIT_H

#include <QObject>
#include <QString>

namespace egalite {

class FileInit : public QObject
{
  Q_OBJECT
public:
  explicit FileInit(QObject *parent = 0);

  void checkInitialized();

signals:

  void movedAddressingTo (const QString & fileIsAt );

public slots:

private:
  QString writablePath();
  QString qrcPath();

  QString     destFilepath;
};

} // namespace
#endif // FILEINIT_H
