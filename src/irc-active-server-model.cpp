#include "irc-active-server-model.h"


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

#include <QHash>
#include <QByteArray>
#include <QDebug>

namespace egalite
{

ActiveServerModel::ActiveServerModel (QObject *parent)
  :QAbstractListModel (parent)
{
  roles[Role_BaseName] = "basename";
  roles[Role_RealName] = "realname";
  roles[Role_Address] = "address";
  roles[Role_Port] = "port";
  roles[Role_State] = "connectstate";
  roles[Role_HaveRealName] = "haverealname";
  roles[Role_BytesIn] = "bytesin";
  roles[Role_BytesOut] = "bytesout";
}

QHash<int, QByteArray>
ActiveServerModel::roleNames()
{
  return roles;
}

void
ActiveServerModel::clear ()
{
  beginResetModel ();
  servers.clear ();
  endResetModel ();
  emit contentChange ();
}

int
ActiveServerModel::rowCount (const QModelIndex & parent) const
{
  Q_UNUSED (parent)
  return servers.count ();
}

void
ActiveServerModel::selectNone ()
{
  emit selectRow (-1);
}

void
ActiveServerModel::disconnectServer (int row)
{
  int ns = servers.count();
  if (row < 0 || row >= ns) {
    return;
  }
  emit wantDisconnect (servers.at(row).socket);
}

void
ActiveServerModel::removeServer (IrcSocket * sock)
{
  int row = findServer (sock);
  if (row < 0) {
    return;
  }
  beginRemoveRows (QModelIndex (), row, row);
  servers.removeAt (row);
  inCounter.removeAt (row);
  outCounter.removeAt (row);
  if (sock) {
    disconnect (sock, SIGNAL (IOActivity()), this, SLOT (UpdateCounts()));
  }
  endRemoveRows ();
  emit contentChange ();
}

QVariant
ActiveServerModel::data (const QModelIndex & index, int role) const
{
  if (!index.isValid()) {
    return QVariant ();
  }
  int row = index.row();
  int nr = servers.count ();
  if (row < 0 || row >= nr) {
    return QVariant ();
  }
  QVariant retVar;
  IrcSocket * sock (0);
  if (servers.at(row).socket) {
    sock = servers.at(row).socket;
  }
  switch (role) {
  case Qt::DisplayRole:
  case Role_BaseName:
    retVar = servers.at(row).baseName;
    break;
  case Role_RealName:
    retVar = servers.at(row).realName;
    break;
  case Role_Address:
    retVar = servers.at(row).address.toString();
    break;
  case Role_Port:
    retVar = QString::number (servers.at(row).port);
    break;
  case Role_State:
    retVar = (sock ? QString::number (sock->state()) : QString ("??"));
    break;
  case Role_HaveRealName:
    retVar = servers.at(row).realSet;
    break;
  case Role_BytesIn:
    retVar = (sock ? sock->BytesIn() : 0);
    break;
  case Role_BytesOut:
    retVar = (sock ? sock->BytesOut() : 0);
    break;
  default:
    break;
  }
  return retVar;
}

void
ActiveServerModel::addServer (IrcSocket *sock,
                  const QString & baseName, 
                  const QString & realName,
                  const QHostAddress & address,
                    int port,
                   bool realSet)
{
  int nr = rowCount();
  beginInsertRows (QModelIndex(), nr, nr);
  servers << ServerStruct (sock, baseName, realName, address, port, realSet);
  qint64 bytesIn (0);
  qint64 bytesOut (0);
  if (sock) {
    bytesIn = sock->BytesIn();
    bytesOut = sock->BytesOut();
    connect (sock, SIGNAL (IOActivity()), this, SLOT (UpdateCounts()));
  }
  inCounter << bytesIn;
  outCounter << bytesOut;
  endInsertRows ();
  emit selectRow (nr);
  emit contentChange ();
}

void
ActiveServerModel::UpdateCounts ()
{
  int nc=servers.count();
  for (int i=0; i<nc; i++) {
    IrcSocket * sock (0);
    sock = servers.at(i).socket;
    if (sock) {
      qint64 oldIn = inCounter.at(i);
      qint64 oldOut = inCounter.at(i);
      qint64 newIn = sock->BytesIn ();
      qint64 newOut = sock->BytesOut ();
      if (newIn != oldIn || newOut != oldOut) {
        inCounter[i] = newIn;
        outCounter[i] = newOut;
        QModelIndex changedIndex = createIndex (i, 0);
        emit dataChanged (changedIndex, changedIndex);
      }
    }
  }
}

int
ActiveServerModel::findServer (const IrcSocket *sock) const
{
  if (sock) {
    int ns = servers.count();
    for (int i=0; i<ns; i++) {
      if (servers.at(i).socket == sock) {
        return i;
      }
    }
  }
  return -1;
}

void
ActiveServerModel::setPort (const IrcSocket *sock, int port)
{
  int row = findServer (sock);
  if (row < 0) {
    return;
  }
  int oldport = servers.at(row).port;
  if (port != oldport) {
    servers[row].port = port;
    QModelIndex changedIndex = createIndex (row, 0);
    emit dataChanged (changedIndex, changedIndex);
  }
}

void
ActiveServerModel::setBaseName (const IrcSocket *sock, const QString & name)
{
  int row = findServer (sock);
  if (row < 0) {
    return;
  }
  servers[row].baseName = name;
  QModelIndex changedIndex = createIndex (row, 0);
  emit dataChanged (changedIndex, changedIndex);
}

void
ActiveServerModel::setRealName (const IrcSocket *sock, const QString & name)
{
  int row = findServer (sock);
  if (row < 0) {
    return;
  }
  servers[row].setReal (name);
  QModelIndex changedIndex = createIndex (row, 0);
  emit dataChanged (changedIndex, changedIndex);
}

void
ActiveServerModel::setAddress (const IrcSocket *sock, 
                               const QHostAddress & addr)
{
  int row = findServer (sock);
  if (row < 0) {
    return;
  }
  servers[row].address = addr;
  QModelIndex changedIndex = createIndex (row, 0);
  emit dataChanged (changedIndex, changedIndex);
}

int
ActiveServerModel::port (const IrcSocket *sock) const
{
  int row = findServer (sock);
  if (row < 0) {
    return -1;
  }
  return servers.at(row).port;
}

QString
ActiveServerModel::baseName (const IrcSocket *sock) const
{
  int row = findServer (sock);
  if (row < 0) {
    return QString();
  }
  return servers.at(row).baseName;
}

QString
ActiveServerModel::realName (const IrcSocket *sock) const
{
  int row = findServer (sock);
  if (row < 0) {
    return QString();
  }
  return servers.at(row).realName;
}

IrcSocket *
ActiveServerModel::socket (int row)
{
  if (row < 0) {
    return 0;
  }
  if (row >= servers.count()) {
    return 0;
  }
  return servers.at(row).socket;
}

QHostAddress
ActiveServerModel::address (const IrcSocket *sock) const
{
  int row = findServer (sock);
  if (row < 0) {
    return QHostAddress();
  }
  return servers.at(row).address;
}

ActiveServerModel::ServerStruct::ServerStruct ()
  :socket(0),
   baseName (""),
   realName (""),
   address (QHostAddress()),
   port (0),
   realSet (false)
{
}

ActiveServerModel::ServerStruct::ServerStruct (IrcSocket * sck,
                  const QString & bn,
                  const QString & rn,
                  const QHostAddress & ad, 
                  int p,
                  bool haveReal)
  :socket (sck),
   baseName(bn),
   realName (rn),
   address (ad),
   port (p),
   realSet (haveReal)
{
}

ActiveServerModel::ServerStruct::ServerStruct (
         const ActiveServerModel::ServerStruct & other)
  :socket (other.socket),
   baseName (other.baseName),
   realName (other.realName),
   port (other.port),
   realSet (other.realSet)
{
}

void
ActiveServerModel::ServerStruct::setReal (const QString & rn)
{
  realName = rn;
  realSet = true;
}


} // namespace
