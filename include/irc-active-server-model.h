#ifndef EGALITE_IRC_ACTIVE_SERVER_MODEL_H
#define EGALITE_IRC_ACITVE_SERVER_MODEL_H

/****************************************************************
 * This file is distributed under the following license:
 *
 * Copyright (C) 2017, Bernd Stramm
 *
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 2
 *  of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, 
 *  Boston, MA  02110-1301, USA.
 ****************************************************************/


#include <QAbstractListModel>
#include <QString>
#include <QHash>
#include <QByteArray>
#include <QList>
#include <QHostAddress>
#include "irc-socket.h"

namespace egalite
{

class ActiveServerModel : public QAbstractListModel
{
Q_OBJECT
public:

  /** \brief stuff invokable from QML */

  Q_INVOKABLE int rowCount (const QModelIndex & index = QModelIndex()) const;
  QVariant data (const QModelIndex & index, 
                  int role = Qt::DisplayRole) const;

  Q_INVOKABLE void disconnectServer (int row);

  /** \brief the rest */

  ActiveServerModel (QObject *parent=0);
  QHash<int, QByteArray>  roleNames() const;

  void clear ();

  void addServer (IrcSocket * sock,
                  const QString & baseName, 
                  const QString & realName,
                  const QHostAddress & address,
                    int port,
                   bool readSet = false);

  int findServer (const IrcSocket *sock) const;
  void removeServer (IrcSocket * sock);

  void setRealName  (const IrcSocket *sock, const QString & name);
  void setAddress   (const IrcSocket *sock, const QHostAddress & addr);
  void setPort      (const IrcSocket *sock, int port);
  void setBaseName  (const IrcSocket *sock, const QString & name);

  QString       baseName (const IrcSocket *sock) const;
  QString       realName (const IrcSocket *sock) const;
  QHostAddress  address (const IrcSocket *sock) const;
  int           port (const IrcSocket *sock) const;

  void          selectNone ();

  IrcSocket    *socket (int row);

private slots:

  void UpdateCounts ();

signals:

  void wantDisconnect (IrcSocket * sock);
  void selectRow (int row);
  void contentChange ();

private:

  QHash<int, QByteArray>  roles;

  enum DataRoles {
    Role_BaseName = Qt::UserRole+1,
    Role_RealName = Qt::UserRole+2,
    Role_Address = Qt::UserRole+3,
    Role_Port = Qt::UserRole+4,
    Role_State = Qt::UserRole+5,
    Role_HaveRealName = Qt::UserRole+6,
    Role_BytesIn = Qt::UserRole+7,
    Role_BytesOut = Qt::UserRole+8
  };

  struct ServerStruct {
    IrcSocket   * socket;
    QString       baseName;
    QString       realName;
    QHostAddress  address;
    int           port;
    bool          realSet;
    ServerStruct ();
    ServerStruct (IrcSocket * sck,
                  const QString & bn,
                  const QString & rn,
                  const QHostAddress & ad, 
                  int pm,
                  bool haveReal = false);
    ServerStruct (const ServerStruct & other);
    void setReal (const QString &rn);
  };

  typedef QList<ServerStruct>   ServerListType;

  ServerListType   servers;
  QList<qint64>    inCounter;
  QList<qint64>    outCounter;

};

} // namespace

#endif
