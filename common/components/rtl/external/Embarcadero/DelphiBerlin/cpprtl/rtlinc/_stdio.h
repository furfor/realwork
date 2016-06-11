/*------------------------------------------------------------------------
 * filename - _stdio.h
 *
 *  Definitions for stream input/output.
 *
 *-----------------------------------------------------------------------*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 1987, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */


/* $Revision: 35783 $ */

#ifndef _SIZE_T
#define _SIZE_T
typedef unsigned size_t;
#endif

#ifdef __cplusplus
extern "C" {
#endif

size_t  __fputn             (const char *__ptr, size_t __n, FILE *__fp);
size_t  __fputnw            (const wchar_t *__ptr, size_t __n, FILE *__fp);
char  * __mkname            (char *__s, char *__pfx, unsigned short __num);
char  * __tmpnam            (char *__s, unsigned short *__numP);
FILE  * __openfp            (FILE *__fp, const char *__fname,
                                const char *__type, int __shflag);
FILE  * __getfp             (void);
int     _allocbuf           (FILE *__fp, char *__buf, int __type, size_t __size);
FILE *  __fopen_helper      (const char *__filename, const char *__type, int __sharemode);

wchar_t  * __wmkname        (wchar_t *__s, wchar_t *__pfx, unsigned short __num);
wchar_t  * __wtmpnam        (wchar_t *__s, unsigned short *__numP);
FILE     * __wopenfp        (FILE *__fp, const wchar_t *__fname,
                             const wchar_t *__type, int __shflag);
FILE     * __wfopen_helper  (const wchar_t *__filename, const wchar_t *__type, int __sharemode);

#ifdef _MT
void    _lock_all_streams   (void);
void    _unlock_all_streams (void);
void    _lock_stream        (FILE *__stream);
void    _unlock_stream      (FILE *__stream);
void    _lock_exit(void);
void    _unlock_exit(void);
#else
#define _lock_all_streams()
#define _unlock_all_streams()
#define _lock_stream(stream)
#define _unlock_stream(stream)
#define _lock_exit()
#define _unlock_exit()
#endif

int _RTLENTRY   _flushall      (void);
int _RTLENTRY   _flushout      (void);
    
/* _lgetc and _lputc are like fgetc and fputc, except that they lock
 * the stream semaphore.
 */
#ifdef _MT
int       _lgetc         (FILE  *__stream );
int       _lgetwc        (FILE  *__stream );
int       _lputc         (int __ch, FILE *__stream );
int       _lputwc        (wint_t __ch, FILE *__stream );
#else
#define _lgetc  fgetc
#define _lgetwc fgetwc
#define _lputc  fputc
#define _lputwc fputwc
#endif

extern  unsigned short _tmpnum;     /* temporary file number */

#ifdef __cplusplus
}
#endif
