#include "irc-known-server-model.h"


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

KnownServerModel::KnownServerModel (QObject *parent)
  :QAbstractListModel (parent),
   isAble (false)
{
  roles[Role_Name] = "sname";
  roles[Role_Port] = "sport";
  setObjectName ("KnownServerModel");
}

void KnownServerModel::dump()
{
  qDebug() << Q_FUNC_INFO << "there are " << servers.count() << "servers:\n";
  for (auto s=servers.begin(); s!= servers.end(); ++s) {
    qDebug() << "server \t " << s->name << ":" << s->port;
  }
}

void
KnownServerModel::setEnabled (bool able)
{
  isAble = able;
  if (isAble) {
    emit contentChange ();
  }
}

void
KnownServerModel::clear ()
{
  beginResetModel ();
  servers.clear ();
  endResetModel ();
  emit contentChange ();
}

QHash<int, QByteArray>
KnownServerModel::roleNames() const
{
  qDebug() << Q_FUNC_INFO << roles;
//  abort();
  return roles;
}

int
KnownServerModel::rowCount (const QModelIndex & parent) const
{
  Q_UNUSED (parent)
  return servers.count ();
}

int
KnownServerModel::zero () const
{
  return 0;
} 
int
KnownServerModel::numRows () const
{
  return servers.count ();
}

QVariant
KnownServerModel::data (const QModelIndex & index, int role) const
{
//qDebug () << " KnownServerModel data " << index << " role " << role;
  if (!index.isValid()) {
    return QVariant ();
  }
  int row = index.row();
  int nr = servers.count ();
  if (row < 0 || row >= nr) {
    return QVariant ();
  }
  QVariant retVar;
  if (role == Qt::DisplayRole || role == Role_Name) {
    retVar = QVariant (servers.at(row).name);
  } else if (role == Role_Port) {
    retVar = QVariant (QString ::number (servers.at(row).port));
  }
  qDebug () << "           return " << retVar;
  return retVar;
}

void
KnownServerModel::addServer (const QString & name, int port)
{
qDebug () << " KnownServerModel::addServer " << name << port;
  int nr = rowCount();
  beginInsertRows (QModelIndex(), nr, nr);
  servers << ServerStruct (name, port);
  endInsertRows ();
  if (isAble) {
    emit contentChange ();
  }
}

void
KnownServerModel::setPort (int row, const QString & port)
{
  int iport = port.toInt();
  int nr = servers.count();
  if (row < 0 || row >= nr) {
    return;
  }
  int oldport = servers.at(row).port;
  if (iport != oldport) {
    servers[row].port = iport;
    QModelIndex changedIndex = createIndex (row, 0);
    emit dataChanged (changedIndex, changedIndex);
  }
}

KnownServerModel::ServerStruct::ServerStruct ()
  :name (""),
   port (0)
{
}

KnownServerModel::ServerStruct::ServerStruct (const QString & n, int p)
  :name (n),
   port (p)
{
}

KnownServerModel::ServerStruct::ServerStruct (
         const KnownServerModel::ServerStruct & other)
  :name (other.name),
   port (other.port)
{
}


} // namespace
