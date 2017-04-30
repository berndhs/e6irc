#ifndef EGALITE_IRC_KNOWN_SERVER_MODEL_H
#define EGALITE_IRC_KNOWN_SERVER_MODEL_H

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
#include <QList>

namespace egalite
{

class KnownServerModel : public QAbstractListModel
{
Q_OBJECT
public:

  /** \brief stuff invokable from QML */

  Q_PROPERTY(int numberOfRows READ numRows) 
  Q_INVOKABLE int zero () const;
  Q_INVOKABLE int  numRows () const ;
  Q_INVOKABLE int rowCount (const QModelIndex & index = QModelIndex()) const;
  QVariant data (const QModelIndex & index, 
                  int role = Qt::DisplayRole) const;

  Q_INVOKABLE void setPort (int row, const QString & port);
  Q_INVOKABLE void setEnabled (bool able);

  /** \brief the rest */

  KnownServerModel (QObject *parent=0);

  void clear ();

  void addServer (const QString & name, int port);

signals:

  void contentChange ();

private:

  enum DataRoles {
    Role_Name = Qt::UserRole+1,
    Role_Port = Qt::UserRole+2
  };

  struct ServerStruct {
    QString  name;
    int      port;
    ServerStruct ();
    ServerStruct (const QString & n, int p);
    ServerStruct (const ServerStruct & other);
  };

  typedef QList<ServerStruct>   ServerListType;

  ServerListType   servers;
  bool             isAble;

};

} // namespace

#endif
