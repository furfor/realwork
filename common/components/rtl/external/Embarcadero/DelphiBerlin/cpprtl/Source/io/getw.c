/*-----------------------------------------------------------------------*
 * filename - _getw.c
 *
 * function(s)
 *        _getw - gets a word from a stream
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

/*---------------------------------------------------------------------*

Name            _getw - gets a word from a stream

Usage           #include <stdio.h>
                int _getw(FILE * stream);

Prototype in    stdio.h

Description     see getc

*---------------------------------------------------------------------*/

int _RTLENTRY _EXPFUNC _getw(FILE *fp)
{
    int c, res, i;
    char *p;

    for (i = 0, p = (char *)&res; i < sizeof(int); i++, p++)
        if ((c = getc(fp)) == EOF)
            return (EOF);
        else
            *p = (char)c;
    return(res);
}
