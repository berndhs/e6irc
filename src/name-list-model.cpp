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
#include <QDebug>

namespace egalite
{

NameListModel::NameListModel (QObject *parent)
  :QAbstractItemModel (parent)
{
  roles[Qt::DisplayRole] = "display";
  roles[Qt::DecorationRole] ="decoration";
  roles[Qt::EditRole] = "edit";
  roles[Qt::ToolTipRole] = "toolTip";
  roles[Qt::StatusTipRole] = "statusTip";
  roles[Qt::WhatsThisRole] = "whatsThis";
  roles[Data_Name] = "name";
  roles[Data_InUse] = "inUse";
  roles[Data_Selected] = "selected";
}

void
NameListModel::load (const QStringList & names)
{
  qDebug() << Q_FUNC_INFO << "setting to names" << names;
  setStringList (names);
  QModelIndex topLeft = createIndex(0,0);
  QModelIndex botRight = createIndex(m_data.count(),0);
  emit dataChanged(topLeft,botRight);
}

QVariant
NameListModel::data (const QModelIndex & index, int role) const
{
//  qDebug() << Q_FUNC_INFO << index << role;
  int row = index.row();
  switch (role) {
  case Data_InUse:
    return m_data[row].inUse;
  case Data_Selected:
    return m_data[row].selected;
  case Data_Name:
    return m_data[row].value;
  default:
    qDebug() << Q_FUNC_INFO << role <<  " is the rold they want.\nde fault with this system is you man";
    return QVariant("invalid role");
  }
}

QModelIndex
NameListModel::index(int row, int column, const QModelIndex &parent) const
{
  return createIndex(row,column) ;
}

QModelIndex
NameListModel::parent(const QModelIndex &child) const
{
  return createIndex(child.row(),0);
}

int
NameListModel::rowCount(const QModelIndex &parent) const
{
  return m_data.count();
}

int
NameListModel::columnCount(const QModelIndex &parent) const
{
  return 1;
}

void
NameListModel::dump()
{
  qDebug() << Q_FUNC_INFO ;
  qDebug() << "Model Content";
  qDebug() << m_data.count() << "items";
  qDebug() << m_data;
  //abort();
}

void
NameListModel::setInUse (const QString & name, bool used)
{ 
  qDebug() << Q_FUNC_INFO << name << used;
  int row = m_index[name];
  bool oldU = m_data[row].inUse;
  m_data[row].inUse = used;
  if (oldU != used) {
    emit dataChanged (index (row,0), index(row,0));
  }
}

void
NameListModel::setSelected (const QString & name, bool selected)
{
  int row = m_index[name];
  bool oldS = m_data[row].selected;
  m_data[row].selected = selected;
  if (oldS != selected) {
    emit dataChanged (index (row,0), index(row,0));
  }
}

bool
NameListModel::inUse (const QString & name) const
{
  int row=m_index[name];
  return m_data[row].inUse;
}

bool
NameListModel::selected (const QString & name) const
{
  int row=m_index[name];
  return m_data[row].selected;
}

QStringList
NameListModel::selectedNames () const
{
  QStringList results;
  for (auto uit=m_data.begin(); uit != m_data.end(); uit++) {
    if (uit->selected) {
      results.append (uit->value);
    }
  }
  return results;
}

void
NameListModel::setStringList(const QStringList &daList)
{
  beginResetModel();
  for (auto s=daList.begin(); s!= daList.end(); ++s) {
    int ndx = m_data.count();
    m_data.append(UsageRec(false,false,*s));
    m_index[*s] = ndx;
  }
  endResetModel();
}

QHash<int, QByteArray>
NameListModel::roleNames() const
{
  qDebug() << Q_FUNC_INFO << this << roles;
//  abort();
  return roles;
}

QDebug & operator<<(QDebug debug, const NameListModel::UsageRec & rec)
{
  debug << "(" << rec.inUse << "," << rec.selected << "," << rec.value << ")";
  return debug;
}

} // namespace
