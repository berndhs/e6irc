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
  Q_PROPERTY(QString os READ getOS NOTIFY osChanged)

  Q_INVOKABLE qreal pixelSize(int mm);

  Q_INVOKABLE void iAmHere (QObject *obj=0);
  Q_INVOKABLE void blow();

  QString getOS() const
  {
    return os;
  }

signals:

  void osChanged (QString newOs);

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
