/*-----------------------------------------------------------------------*
 * filename - cvtfak.c
 *
 * function(s)
 *        __realcvt - fake floating point conversion
 *-----------------------------------------------------------------------*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 1987, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */

/* $Revision: 23293 $        */

#include <_io.h>
#include <string.h>
#include <_tchar.h>

static void _fakecvt(void)
{
    _ErrorExit("printf : floating point formats not linked");
}

static void _fakescan(void)
{
    _ErrorExit("scanf : floating point formats not linked");
}


/* Pointers to the conversion and scanning functions.
 */
void (*_realcvttptr)(void) = _fakecvt;
void (*_nextrealtptr)(void) = _fakecvt;
void (*_scanttodptr)(void) = _fakescan;
void (*_scantrsltptr)(void) = _fakescan;
