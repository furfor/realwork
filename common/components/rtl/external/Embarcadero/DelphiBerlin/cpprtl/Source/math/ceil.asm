;[]-----------------------------------------------------------------[]
;|   CEIL.ASM -- rounding function                                   |
;[]-----------------------------------------------------------------[]

;
;       C/C++ Run Time Library - Version 24.0
; 
;       Copyright (c) 1991, 2016 by Embarcadero Technologies, Inc.
;       All Rights Reserved.
; 

; $Revision: 23293 $

;------------------------------------------------------------------------
; function(s)
;    ceil - rounds up
;------------------------------------------------------------------------


        include RULES.ASI

;       Segments Definitions

Header@

;--------------------------------------------------------------------------
;
;Name            ceil - rounds up
;
;Usage           double ceil(double x);
;
;Prototype in    math.h
;
;Description     ceil finds the smallest integer not less than x.
;
;Return value    ceil returns the integer found as a double.
;---------------------------------------------------------------------------

Code_Seg@

ExtFunc@ _round, _RTLENTRY, 0

Func@   ceil, _EXPFUNC, _RTLENTRY, <double x>

        Link@

        FLD     DOUBLE (x)

        mov     ax, x [6]
        shl     ax, 1
        cmp     ax, 7FE0h + 06A0h       ; 2^53, maximum double precision
        ja      dlm_beyond

        mov     ch, 08          ; iNDP-87 control bits for ceiling mode
        Call@   _round          ; _round() modifies the '87 TOS

dlm_beyond:                     ; magnitudes beyond 2^53 have no fraction
        Unlink@
        Return@

EndFunc@ ceil

Code_EndS@

        end
