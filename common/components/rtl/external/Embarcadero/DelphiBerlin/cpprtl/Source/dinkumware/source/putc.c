/* putc function */
#include "xstdio.h"
_STD_BEGIN

int (putc)(int c, FILE *str)
	{	/* put character to stream */
	return (fputc(c, str));
	}
_STD_END

/*
 * Copyright (c) 1992-2006 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
V5.01:1422 */
