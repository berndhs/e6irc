#include "reconnector.h"
#include <QTimer>
#include "irc-qml-control.h"

namespace egalite {


Reconnector::Reconnector(QObject *parent,
                         const QString &host,
                         const int port) :
  QObject(parent),
  m_host(host),
  m_port(port)
{
  QTimer::singleShot(100,this,SLOT(tryReconnect()));
}

void Reconnector::tryReconnect()
{
  IrcQmlControl * daddy = qobject_cast<IrcQmlControl*>(parent());
  daddy->TryConnect (m_host,m_port);
}

} // namespace

