#ifndef EGALITE_NAME_LIST_MODEL_H
#define EGALITE_NAME_LIST_MODEL_H


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

#include <QList>
#include <QStringList>
#include <QAbstractItemModel>

namespace egalite
{

class NameListModel : public QAbstractItemModel
{
Q_OBJECT
public:

  NameListModel (QObject *parent);

  void load (const QStringList & names);
  void setInUse (const QString & name, bool used);
  void setSelected (const QString & name, bool select);
  bool inUse (const QString & name) const;
  bool selected (const QString & name) const;

  QStringList selectedNames () const;

  void setStringList (const QStringList &daList);


  QHash<int, QByteArray> roleNames() const;

  QVariant data (const QModelIndex & index, int role) const;

  QModelIndex index (int row, int column, const QModelIndex &parent = QModelIndex()) const;
  QModelIndex parent(const QModelIndex &child) const;
  int rowCount(const QModelIndex &parent) const;
  int columnCount(const QModelIndex &parent) const;

  Q_INVOKABLE void dump();

public:
  class UsageRec {
    public:
    UsageRec (bool u, bool s, QString v) : inUse(u),selected(s),value(v) {}
    UsageRec () : inUse (false), selected(false),value(QString()) {}
    bool  inUse;
    bool  selected;
    QString value;

    friend QDebug & operator<<(QDebug debug, const UsageRec &);
  };

private:

  enum DataRole {
//    Data_Name = Qt::DisplayRole,
    Data_Name = Qt::UserRole+1,
    Data_InUse = Qt::UserRole +2,
    Data_Selected = Qt::UserRole +3
  };


  QHash<int, QByteArray> roles;

  QList<UsageRec> m_data;
  QHash<QString, int> m_index;

};

} // namespace


#endif
