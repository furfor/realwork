;----------------------------------------------------------------------
; cwait.asm - user-callable entry point to cwait() function.
;----------------------------------------------------------------------

;
;       C/C++ Run Time Library - Version 24.0
; 
;       Copyright (c) 1991, 2016 by Embarcadero Technologies, Inc.
;       All Rights Reserved.
; 

; $Revision: 23293 $

        include rules.asi
        include entry.inc
        Entry@ cwait, _cwait, _RTLENTRY, 12
        end
