;----------------------------------------------------------------------
; _tzset.nasm - user-callable entry point to _tzset() function.
;----------------------------------------------------------------------

;
;       C/C++ Run Time Library - Version 24.0
; 
;       Copyright (c) 2012, 2016 by Embarcadero Technologies, Inc.
;       All Rights Reserved.
; 

; $Revision$

extern _tzset
global tzset

SECTION .text
tzset:
	jmp	_tzset
