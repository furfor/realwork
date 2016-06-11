/*------------------------------------------------------------------------
 * filename - fseek.c
 *
 * function(s)
 *        fseek        - repositions a file pointer on a stream
 *        ftell        - returns the current file pointer
 *        Displacement - internal function
 *-----------------------------------------------------------------------*/

/*
 *      C/C++ Run Time Library - Version 24.0
 *
 *      Copyright (c) 1987, 2016 by Embarcadero Technologies, Inc.
 *      All Rights Reserved.
 *
 */

/* $Revision: 34073 $        */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <_io.h>
#include <_stdio.h>

#if defined(_OFFSET_64_MS)
#define _OFF_T long long
#define _FSEEK _fseeki64
#define _FTELL _ftelli64
#define __LSEEK _lseeki64
#elif defined(_OFFSET_64_OG)
#define _OFF_T off_t
#define _FSEEK fseeko
#define _FTELL ftello
#define __LSEEK _lseeki64
#else
#define _OFF_T long
#define _FSEEK fseek
#define _FTELL ftell
#define __LSEEK __lseek
#endif

/*---------------------------------------------------------------------*

Name            Displacement

Usage           static int Displacement(FILE *fp);

*---------------------------------------------------------------------*/

static int Displacement (FILE *fp)
{
    register    int level;
    int         disp;
    register    unsigned char *P;

    if (fp->level < 0)
        disp = level = fp->bsize + fp->level + 1;
    else
        disp = level = fp->level;

    if (fp->flags & _F_BIN)
        return disp;

    P = fp->curp;

    if (fp->level < 0)          /* If writing */
    {
        while (level--)         
            if ('\n' == *--P)
                disp++;
    }
    else                        /* Else reading */
    {
        while (level--)         
            if ('\n' == *P++)
                disp++;
    }

    return  disp;
}

/*---------------------------------------------------------------------*

Name            fseek - repositions a file pointer on a stream

Usage           #include <stdio.h>
                int fseek(FILE * stream, long offset, int fromwhere);

Related
functions usage long ftell(FILE *stream);
                int rewind(FILE *stream);

Prototype in    stdio.h

Description     fseek sets the file pointer associated with stream
                to a new position that is offset bytes beyond the file location
                given by fromwhere.

                fromwhere must be one of the values 0, 1 or 2, which 
                represent three symbolic constants (defined in stdio.h)
                as follows:

                fromwhere               File Location
                SEEK_SET        (0)     file beginning
                SEEK_CUR        (1)     current file pointer position
                SEEK_END        (2)     end-ofC3ile

                fseek discards any character pushed back using ungetc.

                rewind(stream) is equivalent to fseek(stream, 0L, SEEK_SET),
                except that rewind clears the end-of-file and error
                indicators while fseek only clears the end-of-file indicator.

                After fseek or rewind, the next operation on an update file
                may be either input or output.

Return value    fseek and rewind return 0 if the pointer
                successfully moved and a non-zero value on failure.

*---------------------------------------------------------------------*/

int _RTLENTRY _EXPFUNC _FSEEK (FILE *fp, _OFF_T offset, int whence)
{
    int rc;


    if (fflush (fp))
        return (EOF);

    _lock_stream(fp);

    if (SEEK_CUR == whence && fp->level > 0)
        offset -= Displacement (fp);

    fp->flags &= ~(_F_OUT | _F_IN | _F_EOF);
    fp->level = 0;
    fp->curp = fp->buffer;

    rc = (__LSEEK (fp->fd, offset, whence) == -1L) ? EOF : 0;

    _unlock_stream(fp);
    return rc;

}

/*---------------------------------------------------------------------*

Name            ftell - returns the current file pointer

Usage           #include <stdio.h>
                long ftell(FILE * stream);

Prototype in    stdio.h

Description     ftell returns the current file pointer located in stream. The
                offset is measured in bytes from the beginning of the file.

Return value    ftell returns the current file-pointer position on success or
                -1L on error.

*---------------------------------------------------------------------*/

_OFF_T _RTLENTRY _EXPFUNC _FTELL (FILE *fp)
{
    _OFF_T    oldpos, rc;

    _lock_stream(fp);

/*  if (fflush (fp))  return(-1L);  */

    if ((rc = __LSEEK( fp->fd, 0L, SEEK_CUR )) != -1)
    {
        if (fp->level < 0)  /* if writing */
        {
            if (_openfd[fp->fd] & O_APPEND)
            {
                /* In append mode, find out how big the file is,
                 * and add the number of buffered bytes to that.
                 */
                oldpos = rc;
                if ((rc = __LSEEK( fp->fd, 0L, SEEK_END )) == -1)
                    RETURN(rc);
                if (__lseek( fp->fd, oldpos, SEEK_SET ) == -1)
                    RETURN(-1);
            }
            rc += Displacement(fp);
        }
        else
            rc -= Displacement(fp);
    }
exit:
   _unlock_stream(fp);
    return rc;
}
