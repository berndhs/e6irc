#ifndef RECONNECTOR_H
#define RECONNECTOR_H

#include <QObject>
#include <QString>

namespace egalite
{

class Reconnector : public QObject
{
  Q_OBJECT
public:
  explicit Reconnector(QObject *parent, const QString &host, const int port);

signals:

private slots:

  void tryReconnect();

private:

  QString m_host;
  int     m_port;
};

} // namespace

#endif // RECONNECTOR_H
