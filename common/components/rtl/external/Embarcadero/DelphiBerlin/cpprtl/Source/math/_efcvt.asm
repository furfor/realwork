;----------------------------------------------------------------------
; _efcvt.asm - user-callable entry points to _ecvt() and _fcvt() functions.
;----------------------------------------------------------------------

;
;       C/C++ Run Time Library - Version 24.0
; 
;       Copyright (c) 1996, 2016 by Embarcadero Technologies, Inc.
;       All Rights Reserved.
; 

; $Revision: 23293 $

        include rules.asi
	include entry.inc
        Entry@ ecvt, _ecvt, _RTLENTRY, 16
        Entry@ fcvt, _fcvt, _RTLENTRY, 16
        end

