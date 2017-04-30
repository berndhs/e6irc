#ifndef EGALITE_HTML_MANGLE_H
#define EGALITE_HTML_MANGLE_H

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

/** Link Mangling functions */

class QString;
class QRegExp;

namespace egalite {

/** \brief Supply Link transformation functions.
  *
  * This class exists solely to provide a number of text processing
  * functions that locate links in a text, and replace these links
  * with formatted Html or custom faux-syntax, so that the resulting
  * text contains links recognized by the viewer module.
  *
  */

class HtmlMangle {

public:

/** \brief Anchorize rearranges the text argument to contain links.
  *
  * The text argument is scanned to find parts that match the \regular 
  * expression. Each matched part is given to the \anchorFunc 
  * function, and the result of that function call replaces the original
  * matched portion in the new text.
  */

static QRegExp HttpExp ();
static QString Anchorize (const QString &text, QRegExp regular, 
                         void (*anchorFunc)(QString&, QString));

/** insert a string (ref) into an html anchor pattern */
static void HtmlAnchor (QString & anchor /** the result */ ,
                        QString  ref     /** the text to decorate */
                       );

static QString Sanitize (const QString & text);
#if 0
static void TwitAtAnchor (QString & anchor , QString  ref);
static void TwitHashAnchor (QString & anchor, QString ref);
#endif

};

}

#endif
