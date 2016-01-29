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


#ifndef _u_int64_tSet_h
#ifdef __GNUG__
#pragma interface
#endif
#define _u_int64_tSet_h 1

#include "Pix.h"
#include "u_int64_t.defs.h"

class u_int64_tSet
{
protected:

  unsigned int                   count;

public:
  inline virtual              ~u_int64_tSet();

  int                   length();                // current number of items
  int                   empty();

  virtual Pix           add(u_int64_t  item) = 0;      // add item; return Pix
  virtual void          del(u_int64_t  item) = 0;      // delete item
  virtual int           contains(u_int64_t  item);     // is item in set?

  virtual void          clear();                 // delete all items

  virtual Pix           first() = 0;             // Pix of first item or 0
  virtual void          next(Pix& i) = 0;        // advance to next or 0
  virtual u_int64_t&          operator () (Pix i) = 0; // access item at i

  virtual int           owns(Pix i);             // is i a valid Pix  ?
  virtual Pix           seek(u_int64_t  item);         // Pix of item

  void                  operator |= (u_int64_tSet& b); // add all items in b
  void                  operator -= (u_int64_tSet& b); // delete items also in b
  void                  operator &= (u_int64_tSet& b); // delete items not in b

  int                   operator == (u_int64_tSet& b);
  int                   operator != (u_int64_tSet& b);
  int                   operator <= (u_int64_tSet& b); 

  void                  error(const char* msg);
  virtual int           OK() = 0;                // rep invariant
};

inline u_int64_tSet::~u_int64_tSet() {}

inline int u_int64_tSet::length()
{
  return count;
}

inline int u_int64_tSet::empty()
{
  return count == 0;
}

#endif
