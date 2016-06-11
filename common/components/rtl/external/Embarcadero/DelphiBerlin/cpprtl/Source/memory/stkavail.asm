;[]-----------------------------------------------------------------[]
;|   STKAVL.ASM -- available stack space                             |
;[]-----------------------------------------------------------------[]

;
;       C/C++ Run Time Library - Version 24.0
; 
;       Copyright (c) 1991, 2016 by Embarcadero Technologies, Inc.
;       All Rights Reserved.
; 

; $Revision: 23293 $

        include rules.asi
	include entry.inc

;-----------------------------------------------------------------------
;
;Name           stackavail - get available stack size
;
;Usage          #include <malloc.h>
;               size_t stackavail(void);
;
;Prototype in   malloc.h
;
;Description    This function returns the approximate number of bytes
;               available in the stack for allocation by alloca().
;
;               This is an entry point to the internal library function
;               _stackavail.  See _stkavl.asm for details.
;
;Return value   The number of available stack bytes.
;
;------------------------------------------------------------------------

        Entry@   stackavail, _stackavail, _RTLENTRY, 0
        end
