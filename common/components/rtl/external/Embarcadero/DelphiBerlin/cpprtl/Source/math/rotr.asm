;[]-----------------------------------------------------------------[]
;|   ROTR.ASM -- right rotate of unsigned short                      |
;[]-----------------------------------------------------------------[]

;
;       C/C++ Run Time Library - Version 24.0
; 
;       Copyright (c) 1991, 2016 by Embarcadero Technologies, Inc.
;       All Rights Reserved.
; 

; $Revision: 23293 $

        include RULES.ASI

;       Segments Definitions

Header@

;-----------------------------------------------------------------------
;
;Name           _rotr - rotates an unsigned short right
;
;Usage          unsigned short _rotr(unsigned short val, int rotate_count)
;
;Prototype in   stdlib.h
;
;Description    _rotr rotates an unsigned short val right rotate_count
;               bits.
;
;Return value   the value after rotation
;
;-----------------------------------------------------------------------

Code_seg@

Func@   _rotr, _EXPFUNC, _RTLENTRY, <short val>, <int rcount>

        movzx   eax, word ptr [esp+4]   ; get short value and zero high word
        mov     ecx, [esp+8]            ; get rotate count
        ror     ax,cl                   ; rotate the low word
        Return@

EndFunc@ _rotr

Code_EndS@

        end
