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

#ifdef __GNUG__
#pragma implementation
#endif
//#include <stream.h>
#include "date.SplaySet.h"


/* 

 struct to simulate the special `null' node in the Sleater & Tarjan JACM 1985
 splay tree algorithms

 All routines use a version of their `simple top-down' splay alg. (p 669)

*/

/*
 traversal primitives
*/


dateSplayNode* dateSplaySet::leftmost()
{
  dateSplayNode* t = root;
  if (t != 0) while (t->lt != 0) t = t->lt;
  return t;
}

dateSplayNode* dateSplaySet::rightmost()
{
  dateSplayNode* t = root;
  if (t != 0) while (t->rt != 0) t = t->rt;
  return t;
}

dateSplayNode* dateSplaySet::succ(dateSplayNode* t)
{
  if (t == 0)
    return 0;
  if (t->rt != 0)
  {
    t = t->rt;
    while (t->lt != 0) t = t->lt;
    return t;
  }
  else
  {
    for (;;)
    {
      if (t->par == 0 || t == t->par->lt)
        return t->par;
      else
        t = t->par;
    }
  }
}

dateSplayNode* dateSplaySet::pred(dateSplayNode* t)
{
  if (t == 0)
    return 0;
  else if (t->lt != 0)
  {
    t = t->lt;
    while (t->rt != 0) t = t->rt;
    return t;
  }
  else
  {
    for (;;)
    {
      if (t->par == 0 || t == t->par->rt)
        return t->par;
      else
        t = t->par;
    }
  }
}


Pix dateSplaySet::seek(date& key)
{
  dateSplayNode* t = root;
  if (t == 0)
    return 0;

  int comp = dateCMP(key, t->item);
  if (comp == 0)
    return Pix(t);

  dateSplayNode* dummy = (dateSplayNode*)(&_dummy_null);
  dateSplayNode* l = dummy;
  dateSplayNode* r = dummy;
  dummy->rt = dummy->lt = dummy->par = 0;

  while (comp != 0)
  {
    if (comp > 0)
    {
      dateSplayNode* tr = t->rt;
      if (tr == 0)
        break;
      else
      {
        comp = dateCMP(key, tr->item);
        if (comp <= 0 || tr->rt == 0)
        {
          l->rt = t; t->par = l;
          l = t;
          t = tr;
          if (comp >= 0)
            break;
        }
        else
        {
          if ((t->rt = tr->lt) != 0) t->rt->par = t;
          tr->lt = t; t->par = tr;
          l->rt = tr; tr->par = l;
          l = tr;
          t = tr->rt;
          comp = dateCMP(key, t->item);
        }
      }
    }
    else
    {
      dateSplayNode* tl = t->lt;
      if (tl == 0)
        break;
      else
      {
        comp = dateCMP(key, tl->item);
        if (comp >= 0 || tl->lt == 0)
        {
          r->lt = t; t->par = r;
          r = t;
          t = tl;
          if (comp <= 0)
            break;
        }
        else
        {
          if ((t->lt = tl->rt) != 0) t->lt->par = t;
          tl->rt = t; t->par = tl;
          r->lt = tl; tl->par = r;
          r = tl;
          t = tl->lt;
          comp = dateCMP(key, t->item);
        }
      }
    }
  }
  if ((r->lt = t->rt) != 0) r->lt->par = r;
  if ((l->rt = t->lt) != 0) l->rt->par = l;
  if ((t->lt = dummy->rt) != 0) t->lt->par = t;
  if ((t->rt = dummy->lt) != 0) t->rt->par = t;
  t->par = 0;
  root = t;
  return (comp == 0) ? Pix(t) : 0;
}



Pix dateSplaySet::add(date& item)
{
  dateSplayNode* t = root;
  if (t == 0)
  {
    ++count;
    root = new dateSplayNode(item);
    return Pix(root);
  }
  int comp = dateCMP(item, t->item);
  if (comp == 0)
    return Pix(t);

  dateSplayNode* dummy = (dateSplayNode*)(&_dummy_null);
  dateSplayNode* l = dummy;
  dateSplayNode* r = dummy;
  dummy->rt = dummy->lt = dummy->par = 0;

  while (comp != 0)
  {
    if (comp > 0)
    {
      dateSplayNode* tr = t->rt;
      if (tr == 0)
      {
        ++count;
        tr = new dateSplayNode(item);
        comp = 0;
      }
      else
        comp = dateCMP(item, tr->item);
        
      if (comp <= 0)
      {
        l->rt = t; t->par = l;
        l = t;
        t = tr;
      }
      else 
      {
        dateSplayNode* trr = tr->rt;
        if (trr == 0)
        {
          ++count;
          trr =  new dateSplayNode(item);
          comp = 0;
        }
        else
          comp = dateCMP(item, trr->item);

        if ((t->rt = tr->lt) != 0) t->rt->par = t;
        tr->lt = t; t->par = tr;
        l->rt = tr; tr->par = l;
        l = tr;
        t = trr;
      }
    }
    else
    {
      dateSplayNode* tl = t->lt;
      if (tl == 0)
      {
        ++count;
        tl = new dateSplayNode(item);
        comp = 0;
      }
      else
        comp = dateCMP(item, tl->item);

      if (comp >= 0)
      {
        r->lt = t; t->par = r;
        r = t;
        t = tl;
      }
      else
      {
        dateSplayNode* tll = tl->lt;
        if (tll == 0)
        {
          ++count;
          tll = new dateSplayNode(item);
          comp = 0;
        }
        else
          comp = dateCMP(item, tll->item);

        if ((t->lt = tl->rt) != 0) t->lt->par = t;
        tl->rt = t; t->par = tl;
        r->lt = tl; tl->par = r;
        r = tl;
        t = tll;
      }
    }
  }
  if ((r->lt = t->rt) != 0) r->lt->par = r;
  if ((l->rt = t->lt) != 0) l->rt->par = l;
  if ((t->lt = dummy->rt) != 0) t->lt->par = t;
  if ((t->rt = dummy->lt) != 0) t->rt->par = t;
  t->par = 0;
  root = t;
  return Pix(root);
}

void dateSplaySet::del(date& key)
{
  dateSplayNode* t = (dateSplayNode*)(seek(key));
  if (t == 0) return;

  dateSplayNode* p = t->par;

  --count;
  if (t->rt == 0)
  {
    if (t == root)
    {
      if ((root = t->lt) != 0) root->par = 0;
    }
    else if (t == p->lt)
    {
      if ((p->lt = t->lt) != 0) p->lt->par = p;
    }
    else
      if ((p->rt = t->lt) != 0) p->rt->par = p;
  }
  else
  {
    dateSplayNode* r = t->rt;
    dateSplayNode* l = r->lt;
    for(;;)
    {
      if (l == 0)
      {
        if (t == root)
        {
          root = r;
          r->par = 0;
        }
        else if (t == p->lt) 
        {
          p->lt = r;
          r->par = p;
        }
        else
        {
          p->rt = r;
          r->par = p;
        }
        if ((r->lt = t->lt) != 0) r->lt->par = r;
        break;
      }
      else
      {
        if ((r->lt = l->rt) != 0) r->lt->par = r;
        l->rt = r; r->par = l;
        r = l;
        l = l->lt;
      }
    }
  }
  delete t;
}


void dateSplaySet::_kill(dateSplayNode* t)
{
  if (t != 0)
  {
    _kill(t->lt);
    _kill(t->rt);
    delete t;
  }
}


dateSplayNode* dateSplaySet::_copy(dateSplayNode* t)
{
  if (t != 0)
  {
    dateSplayNode* l = _copy(t->lt);
    dateSplayNode* r = _copy(t->rt);
    dateSplayNode* x = new dateSplayNode(t->item, l, r);
    if (l != 0) l->par = x;
    if (r != 0) r->par = x;
    return x;
  }
  else 
    return 0;
}

/* relationals */

int dateSplaySet::operator == (dateSplaySet& y)
{
  if (count != y.count)
    return 0;
  else
  {
    dateSplayNode* t = leftmost();
    dateSplayNode* u = y.leftmost();
    for (;;)
    {
      if (t == 0)
        return 1;
      else if (!dateEQ(t->item, u->item))
        return 0;
      else
      {
        t = succ(t);
        u = y.succ(u);
      }
    }
  }
}

int dateSplaySet::operator <= (dateSplaySet& y)
{
  if (count > y.count)
    return 0;
  else
  {
    dateSplayNode* t = leftmost();
    dateSplayNode* u = y.leftmost();
    for (;;)
    {
      if (t == 0)
        return 1;
      else if (u == 0)
        return 0;
      int cmp = dateCMP(t->item, u->item);
      if (cmp == 0)
      {
        t = succ(t);
        u = y.succ(u);
      }
      else if (cmp < 0)
        return 0;
      else
        u = y.succ(u);
    }
  }
}


void dateSplaySet::operator |=(dateSplaySet& y)
{
  if (&y == this) return;
  dateSplayNode* u = y.leftmost();
  while (u != 0)
  {
    add(u->item);
    u = y.succ(u);
  }
}

void dateSplaySet::operator &= (dateSplaySet& y)
{
  if (y.count == 0)
    clear();
  else if (&y != this && count != 0)
  {
    dateSplayNode* t = leftmost();
    while (t != 0)
    {
      dateSplayNode* s = succ(t);
      if (y.seek(t->item) == 0) del(t->item);
      t = s;
    }
  }
}


void dateSplaySet::operator -=(dateSplaySet& y)
{
  if (&y == this)
    clear();
  else if (y.count != 0)
  {
    dateSplayNode* t = leftmost();
    while (t != 0)
    {
      dateSplayNode* s = succ(t);
      if (y.seek(t->item) != 0) del(t->item);
      t = s;
    }
  }
}

int dateSplaySet::OK()
{
  int v = 1;
  if (root == 0) 
    v = count == 0;
  else
  {
    unsigned int n = 1;
    dateSplayNode* trail = leftmost();
    dateSplayNode* t = succ(trail);
    while (t != 0)
    {
      ++n;
      v &= dateCMP(trail->item, t->item) < 0;
      trail = t;
      t = succ(t);
    }
    v &= n == count;
  }
  if (!v) error("invariant failure");
  return v;
}
