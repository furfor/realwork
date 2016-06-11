/*------------------------------------------------------------------------
 * filename - cprintf.c
 *
 * function(s)
 *    cprintf - sends formatted output to the console
 *-----------------------------------------------------------------------*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 1987, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */

/* $Revision: 23293 $        */

#include <_printf.h>
#include <_video.h>

/*---------------------------------------------------------------------*

Name            cprintf - sends formatted output to the console

Usage           int cprintf(char *format [,argument, ...]);

Prototype in    conio.h

Description     member of the printf family.  cprintf send its output
                directly to the console.  It does not translate linefeed
                characters into CR/LF combinations.

Return value    success : the number of bytes output.
                error : EOF

*------------------------------------------------------------------------*/

int _RTLENTRY _EXPFUNC cprintf(const char *fmt, ...)
{
    va_list ap;
    int ret;

    va_start(ap,fmt);
    ret = __vprinter((putnF *)__cputn, 0, fmt, 0, 0, ap);
    va_end(ap);
    return (ret);
}
