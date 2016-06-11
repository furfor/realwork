/*
*
*    INITCAT.H
*
*    locale initialization definitions
*
*
*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 1996, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */


/* $Revision: 23293 $ */

#include <_locale.h>

#define MAX_LANGID LANG_FAEROESE // Highest right now

#ifdef __cplusplus
  extern "C" {
#endif

int _setCType(LCID locale, LONG codepage, LPWIN32CTYPE Ctype);
int _setMonetary(LCID locale, LPWIN32MONETARY Monetary);
int _setTime(LCID locale, LPWIN32TIME Time);
int _setNumeric(LCID locale, LPWIN32NUMERIC Numeric);
int _setCollate(LCID locale, LPWIN32COLLATE Collate);

#ifdef __cplusplus
  }
#endif


