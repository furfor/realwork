/*-----------------------------------------------------------------------*
 * filename - xfflush.c
 *
 * function(s)
 *        _xfflush - flushes streams
 *-----------------------------------------------------------------------*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 1987, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */

/* $Revision: 23293 $        */

#include <stdio.h>
#include <_stdio.h>

/*---------------------------------------------------------------------*

Name        _xfflush - flushes streams

Usage       void _xfflush(void)

Description called at exit to flush open streams

*---------------------------------------------------------------------*/

void _xfflush(void)
{
    FILE   *fp;
    int    i;

    _lock_all_streams();
    for (i = 0, fp = _streams; i < _nfile; i++, fp++)
        if (fp->flags & _F_RDWR)
            fflush(fp);
    _unlock_all_streams();
}
