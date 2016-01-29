// This may look like C code, but it is really -*- C++ -*-
/* 
Copyright (C) 1988 Free Software Foundation
    written by Doug Lea (dl@rocky.oswego.edu)

This file is part of the GNU C++ Library.  This library is free
software; you can redistribute it and/or modify it under the terms of
the GNU Library General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.  This library is distributed in the hope
that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.  See the GNU Library General Public License for more details.
You should have received a copy of the GNU Library General Public
License along with this library; if not, write to the Free Software
Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/


#ifndef _dateSet_h
#ifdef __GNUG__
#pragma interface
#endif
#define _dateSet_h 1

#include "Pix.h"
#include "date.defs.h"

class dateSet
{
protected:

  unsigned int                   count;

public:
  inline virtual              ~dateSet();

  int                   length();                // current number of items
  int                   empty();

  virtual Pix           add(date& item) = 0;      // add item; return Pix
  virtual void          del(date& item) = 0;      // delete item
  virtual int           contains(date& item);     // is item in set?

  virtual void          clear();                 // delete all items

  virtual Pix           first() = 0;             // Pix of first item or 0
  virtual void          next(Pix& i) = 0;        // advance to next or 0
  virtual date&          operator () (Pix i) = 0; // access item at i

  virtual int           owns(Pix i);             // is i a valid Pix  ?
  virtual Pix           seek(date& item);         // Pix of item

  void                  operator |= (dateSet& b); // add all items in b
  void                  operator -= (dateSet& b); // delete items also in b
  void                  operator &= (dateSet& b); // delete items not in b

  int                   operator == (dateSet& b);
  int                   operator != (dateSet& b);
  int                   operator <= (dateSet& b); 

  void                  error(const char* msg);
  virtual int           OK() = 0;                // rep invariant
};

inline dateSet::~dateSet() {}

inline int dateSet::length()
{
  return count;
}

inline int dateSet::empty()
{
  return count == 0;
}

#endif
