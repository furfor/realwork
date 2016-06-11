/*-----------------------------------------------------------------------*
 * filename - wherexy.c
 *
 * function(s)
 *        wherex - gives horizontal cursor position within window
 *        wherey - gives vertical cursor position within window
 *-----------------------------------------------------------------------*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 1987, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */

/* $Revision: 23293 $        */

#include <_video.h>
#include <conio.h>

/*---------------------------------------------------------------------*

Name            wherex - returns the horizontal position within window

Usage           int wherex(void);

Related
functions usage int wherey(void);

Prototype in    conio.h

Description     wherex returns the x-coordinate of the current cursor
                position (within the current text window). wherey
                returns the y-coordinate of the current cursor position
                (within the current text window).

Return value    integer in the range 1 to 80

*---------------------------------------------------------------------*/

int _RTLENTRY _EXPFUNC wherex(void)
{
        return (_wherex() - _video.windowx1 + 1);
}

/*---------------------------------------------------------------------*

Name            wherey - returns the vertical position within window

Usage           int wherey(void);

Related
functions usage int wherex(void);

Prototype in    conio.h

Description     wherex returns the x-coordinate of the current cursor
                position (within the current text window). wherey
                returns the y-coordinate of the current cursor position
                (within the current text window).

Return value    integer in the range 1 to 80

*---------------------------------------------------------------------*/

int _RTLENTRY _EXPFUNC wherey(void)
{
        return (_wherey() - _video.windowy1 + 1);
}
