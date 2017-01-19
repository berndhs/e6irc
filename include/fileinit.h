#ifndef FILEINIT_H
#define FILEINIT_H

#include <QObject>

class FileInit : public QObject
{
  Q_OBJECT
public:
  explicit FileInit(QObject *parent = 0);

signals:

public slots:
};

#endif // FILEINIT_H
