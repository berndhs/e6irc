#include "name-list-model.h"


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

namespace egalite
{

NameListModel::NameListModel (QObject *parent)
  :QStringListModel (parent)
{
  roles[Qt::DisplayRole] = "name";
  roles[Data_InUse] = "inUse";
  roles[Data_Selected] = "selected";
}

void
NameListModel::load (const QStringList & names)
{
  usage.clear();
  setStringList (names);
}

QVariant
NameListModel::data (const QModelIndex & index, int role) const
{
  QString name = QStringListModel::data (index,Data_Name).toString();
  switch (role) {
  case Data_InUse: 
    return usage[name].inUse; 
  case Data_Selected:
    return usage[name].selected;
  default:
    return QStringListModel::data (index,role);
  }
}

void
NameListModel::setInUse (const QString & name, bool used)
{
  int row = stringList().indexOf (name);
  usage[name].inUse = used;
  emit dataChanged (index (row,0), index(row,0));
}

void
NameListModel::setSelected (const QString & name, bool selected)
{
  int row = stringList().indexOf (name);
  usage[name].selected = selected;
  emit dataChanged (index (row,0), index(row,0));
}

bool
NameListModel::inUse (const QString & name) const
{
  if (usage.contains(name)) {
    return usage[name].inUse;
  } else {
    return false;
  }
}

bool
NameListModel::selected (const QString & name) const
{
  if (usage.contains(name)) {
    return usage[name].selected;
  } else {
    return false;
  }
}

QStringList
NameListModel::selectedNames () const
{
  QStringList results;
  for (auto uit=usage.begin(); uit != usage.end(); uit++) {
    if (uit.value().selected) {
      results.append (uit.key());
    }
  }
  return results;
}

QHash<int, QByteArray>
NameListModel::roleNames()
{
  return roles;
}

} // namespace
