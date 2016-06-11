/*-----------------------------------------------------------------------*
 * filename - lsetlocl.c
 *
 * function(s)
 *      _lsetlocale   - set the locale for ANSI applications
 *-----------------------------------------------------------------------*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 1996, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */

/* $Revision: 23293 $        */

#include <_locale.h>

char * _RTLENTRY _EXPFUNC _lsetlocale( int category, const char *locale )
{
    char *setlocale_result;

    /* first lock the global locale */
    _lock_locale();

    setlocale_result = _setLocale32A( category, locale );

    /* unlock locale before leaving */
    _unlock_locale();

    return( setlocale_result );
}

