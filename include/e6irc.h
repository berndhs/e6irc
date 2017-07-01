#ifndef EGALITE_E6IRC_H
#define EGALITE_E6IRC_H

#include <QDeclarativeView>
#include <QSize>
#include <QTimer>
#include <QString>
#include "irc-qml-control.h"
#include "irc-qml-channel-group.h"

namespace egalite
{
class E6Irc : public QDeclarativeView
{
Q_OBJECT
public:

  E6Irc (QWidget *parent, bool isPhone);
  
  void run (const QSize & desktopSize);
  void setIconNames(const QString &normalName,
                    const QString &hiName);
public slots:

  void checkMention();
  void userLooking();

private slots:

  void allDone ();

signals:

  void quit ();
  
private:

  void fixCaps (QObject * root);

  bool                  isProbablyPhone;
  IrcQmlChannelGroup  * m_channelGroup;
  IrcQmlControl       * m_control;

  QString             m_normalIcon;
  QString             m_hiIcon;
  bool                m_usingHiIcon;

  int                   objectCount;
  QTimer              * m_iconChanger;
  static int            m_mentionedCount;
  
};

}

#endif // E6IRC_H
