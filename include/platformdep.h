#ifndef PLATFORMDEP_H
#define PLATFORMDEP_H

#include <QObject>
#include <QString>

namespace egalite {

class PlatformDep : public QObject
{
  Q_OBJECT
public:
  explicit PlatformDep(QObject *parent = 0);
  void setRoot (QObject * rootObj);
  Q_PROPERTY(QString os READ getOS)

  Q_INVOKABLE qreal pixelSize(int mm);

  QString getOS() const
  {
    return os;
  }

signals:

public slots:

private:

  QObject *theRoot;
  QString os;
  qreal   mmPerPix;
  int     widthPixels;
  int     heightPixels;
  QString m_os;
};

} // namespace
#endif // PLATFORMDEP_H
