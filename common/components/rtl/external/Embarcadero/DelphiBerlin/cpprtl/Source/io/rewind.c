/*-----------------------------------------------------------------------*
 * filename - rewind.c
 *
 * function(s)
 *        rewind - repositions a stream
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

/*-----------------------------------------------------------------------*

Name            rewind - repositions a stream

Usage           void rewind (FILE *fp);

Prototype in    stdio.h

Description     resets the file position to the beginning of file.  rewind
                also clears the end-of-file and error indicators.

Return value    success : 0
                failure : non-zero

*------------------------------------------------------------------------*/

void _RTLENTRY _EXPFUNC rewind (FILE *fp)
{
    _lock_stream(fp);
    if (fseek (fp, 0L, SEEK_SET) == 0)
        fp->flags &= ~_F_ERR;
    _unlock_stream(fp);
}

