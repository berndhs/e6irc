#ifndef PLATFORMDEP_H
#define PLATFORMDEP_H

#include <QObject>
#include <QString>
#include "deliberate.h"

namespace egalite {

class PlatformDep : public QObject
{
  Q_OBJECT
public:
  explicit PlatformDep(QObject *parent = 0);
  void setRoot (QObject * rootObj);
  Q_PROPERTY(QString os READ getOS NOTIFY osChanged)
  Q_PROPERTY(int stdRowHeight READ stdRowHeight NOTIFY stdRowHeightChanged)

  Q_INVOKABLE qreal pixelSize(int mm);

  Q_INVOKABLE void iAmHere (QObject *obj=0);
  Q_INVOKABLE void blow();

  QString getOS() const
  {
    return m_os;
  }

  int stdRowHeight() const;

signals:

  void osChanged (QString newOs);

  void stdRowHeightChanged(int stdRowHeight);

public slots:

private:

  QObject *theRoot;
  qreal   pixelRate;
  int     widthPixels;
  int     heightPixels;
  QString m_os;
  int     m_stdRowHeight;
};

} // namespace
#endif // PLATFORMDEP_H
