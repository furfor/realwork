;[]-----------------------------------------------------------------[]
;|   _LL.NASM -- Win32 ELF integer division                          |
;[]-----------------------------------------------------------------[]
;
;
;       C/C++ Run Time Library - Version 24.0
; 
;       Copyright (c) 2003, 2016 by Embarcadero Technologies, Inc.
;       All Rights Reserved.
; 

; $Revision: 34734 $
;
;
;  This is source for the compiler helper functions that manipulate
;  64-bit integers (__int64's in C & C++).
;

CPU 386

SECTION .text

global  __llmul
global  __lldiv
global  __lludiv
global  __llmod
global  __llumod
global  __llshl
global  __llshr
global  __llushr

;
; These functions always return the 64-bit result in EAX:EDX
;

; ------------------------------------------------------------------------------
;   64-bit unsigned multiply
; ------------------------------------------------------------------------------
;
;  Param 1(EAX:EDX), Param 2([ESP+8]:[ESP+4])  ; before reg pushing
;

__llmul:

        push    edx
        push    eax

        mov     eax, [esp+16]
        mul     dword [esp]
        mov     ecx, eax
        mov     eax, [esp+4]
        mul     dword [esp+12]
        add     ecx, eax
        mov     eax, [esp]
        mul     dword [esp+12]
        add     edx, ecx

        pop     ecx
        pop     ecx

        ret     8


; ------------------------------------------------------------------------------
;   64-bit signed division
; ------------------------------------------------------------------------------

;
;  Dividend = Numerator, Divisor = Denominator
;
;  Dividend(EAX:EDX), Divisor([ESP+8]:[ESP+4])  ; before reg pushing
;
;

__lldiv:

        push    ebp
        push    ebx
        push    esi
        push    edi

        xor     edi,edi

        mov     ebx,[esp+20]            ; get the divisor low dword
        mov     ecx,[esp+24]            ; get the divisor high dword

        or      ecx,ecx
        jnz     @__lldiv@slow_ldiv      ; both high words are zero

        or      edx,edx
        jz      @__lldiv@quick_ldiv

        or      ebx,ebx
        jz      @__lldiv@quick_ldiv     ; if ecx:ebx == 0 force a zero divide
                                        ; we don't expect this to actually
                                        ; work

@__lldiv@slow_ldiv:

;
;               Signed division should be done.  Convert negative
;               values to positive and do an unsigned division.
;               Store the sign value in the next higher bit of
;               di (test mask of 4).  Thus when we are done, testing
;               that bit will determine the sign of the result.
;
        or      edx,edx                 ; test sign of dividend
        jns     @__lldiv@onepos
        neg     edx
        neg     eax
        sbb     edx,0                   ; negate dividend
        or      edi,1
@__lldiv@onepos:
        or      ecx,ecx                 ; test sign of divisor
        jns     @__lldiv@positive
        neg     ecx
        neg     ebx
        sbb     ecx,0                   ; negate divisor
        xor     edi,1
@__lldiv@positive:
        mov     ebp,ecx
        mov     ecx,64                  ; shift counter
        push    edi                     ; save the flags
;
;       Now the stack looks something like this:
;
;               24[esp]: divisor (high dword)
;               20[esp]: divisor (low dword)
;               16[esp]: return EIP
;               12[esp]: previous EBP
;                8[esp]: previous EBX
;                4[esp]: previous ESI
;                 [esp]: previous EDI
;
        xor     edi,edi                 ; fake a 64 bit dividend
        xor     esi,esi                 ;
@__lldiv@xloop:
        shl     eax,1                   ; shift dividend left one bit
        rcl     edx,1
        rcl     esi,1
        rcl     edi,1
        cmp     edi,ebp                 ; dividend larger?
        jb      @__lldiv@nosub
        ja      @__lldiv@subtract
        cmp     esi,ebx                 ; maybe
        jb      @__lldiv@nosub
@__lldiv@subtract:
        sub     esi,ebx
        sbb     edi,ebp                 ; subtract the divisor
        inc     eax                     ; build quotient
@__lldiv@nosub:
        loop    @__lldiv@xloop
;
;       When done with the loop the four registers values' look like:
;
;       |     edi    |    esi     |    edx     |    eax     |
;       |        remainder        |         quotient        |
;
        pop     ebx                     ; get control bits
        test    ebx,1                   ; needs negative
        jz      @__lldiv@finish
        neg     edx
        neg     eax
        sbb     edx,0                   ; negate
@__lldiv@finish:
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret     8

@__lldiv@quick_ldiv:
        div     ebx                     ; unsigned divide
        xor     edx,edx
        jmp     short @__lldiv@finish

;__lldiv        ENDP


; ------------------------------------------------------------------------------
;   64-bit unsigned division
; ------------------------------------------------------------------------------

;  Dividend(EAX:EDX), Divisor([ESP+8]:[ESP+4])  ; before reg pushing
__lludiv:

        push    ebp
        push    ebx
        push    esi
        push    edi

;       dividend is pushed last, therefore the first in the args
;       divisor next.
;
        mov     ebx,[esp+20]            ; get the first low word
        mov     ecx,[esp+24]            ; get the first high word

        or      ecx,ecx
        jnz     @__lludiv@slow_ldiv     ; both high words are zero

        or      edx,edx
        jz      @__lludiv@quick_ldiv

        or      ebx,ebx
        jz      @__lludiv@quick_ldiv    ; if ecx:ebx == 0 force a zero divide
                                        ; we don't expect this to actually
                                        ; work

@__lludiv@slow_ldiv:

        mov     ebp,ecx
        mov     ecx,64                  ; shift counter
;
;       Now the stack looks something like this:
;
;               24[esp]: divisor (high dword)
;               20[esp]: divisor (low dword)
;               16[esp]: return EIP
;               12[esp]: previous EBP
;                8[esp]: previous EBX
;                4[esp]: previous ESI
;                 [esp]: previous EDI
;
        xor     edi,edi                 ; fake a 64 bit dividend
        xor     esi,esi                 ;
@__lludiv@xloop:
        shl     eax,1                   ; shift dividend left one bit
        rcl     edx,1
        rcl     esi,1
        rcl     edi,1
        cmp     edi,ebp                 ; dividend larger?
        jb      @__lludiv@nosub
        ja      @__lludiv@subtract
        cmp     esi,ebx                 ; maybe
        jb      @__lludiv@nosub
@__lludiv@subtract:
        sub     esi,ebx
        sbb     edi,ebp                 ; subtract the divisor
        inc     eax                     ; build quotient
@__lludiv@nosub:
        loop    @__lludiv@xloop
;
;       When done with the loop the four registers values' look like:
;
;       |     edi    |    esi     |    edx     |    eax     |
;       |        remainder        |         quotient        |
;

@__lludiv@finish:
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret     8

@__lludiv@quick_ldiv:
        div     ebx                     ; unsigned divide
        xor     edx,edx
        jmp     short @__lludiv@finish

;__lludiv       ENDP


; ------------------------------------------------------------------------------
;   64-bit modulo
; ------------------------------------------------------------------------------

;  Dividend(EAX:EDX), Divisor([ESP+8]:[ESP+4])  ; before reg pushing
__llmod:


        push    ebp
        push    ebx
        push    esi
        push    edi

        xor     edi,edi
;
;       dividend is pushed last, therefore the first in the args
;       divisor next.
;
        mov     ebx,[esp+20]            ; get the first low word
        mov     ecx,[esp+24]            ; get the first high word

        or      ecx,ecx
        jnz     @__llmod@slow_ldiv      ; both high words are zero

        or      edx,edx
        jz      @__llmod@quick_ldiv

        or      ebx,ebx
        jz      @__llmod@quick_ldiv     ; if ecx:ebx == 0 force a zero divide
                                        ; we don't expect this to actually
                                        ; work

@__llmod@slow_ldiv:

;
;               Signed division should be done.  Convert negative
;               values to positive and do an unsigned division.
;               Store the sign value in the next higher bit of
;               di (test mask of 4).  Thus when we are done, testing
;               that bit will determine the sign of the result.
;
        or      edx,edx                 ; test sign of dividend
        jns     @__llmod@onepos
        neg     edx
        neg     eax
        sbb     edx,0                   ; negate dividend
        or      edi,1
@__llmod@onepos:
        or      ecx,ecx                 ; test sign of divisor
        jns     @__llmod@positive
        neg     ecx
        neg     ebx
        sbb     ecx,0                   ; negate divisor

@__llmod@positive:
        mov     ebp,ecx
        mov     ecx,64                  ; shift counter
        push    edi                     ; save the flags
;
;       Now the stack looks something like this:
;
;               24[esp]: divisor (high dword)
;               20[esp]: divisor (low dword)
;               16[esp]: return EIP
;               12[esp]: previous EBP
;                8[esp]: previous EBX
;                4[esp]: previous ESI
;                 [esp]: previous EDI
;
        xor     edi,edi                 ; fake a 64 bit dividend
        xor     esi,esi                 ;
@__llmod@xloop:
        shl     eax,1                   ; shift dividend left one bit
        rcl     edx,1
        rcl     esi,1
        rcl     edi,1
        cmp     edi,ebp                 ; dividend larger?
        jb      @__llmod@nosub
        ja      @__llmod@subtract
        cmp     esi,ebx                 ; maybe
        jb      @__llmod@nosub
@__llmod@subtract:
        sub     esi,ebx
        sbb     edi,ebp                 ; subtract the divisor
        inc     eax                     ; build quotient
@__llmod@nosub:
        loop    @__llmod@xloop
;
;       When done with the loop the four registers values' look like:
;
;       |     edi    |    esi     |    edx     |    eax     |
;       |        remainder        |         quotient        |
;
        mov     eax,esi
        mov     edx,edi                 ; use remainder

        pop     ebx                     ; get control bits
        test    ebx,1                   ; needs negative
        jz      @__llmod@finish
        neg     edx
        neg     eax
        sbb     edx,0                   ; negate
@__llmod@finish:
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret     8

@__llmod@quick_ldiv:
        div     ebx                     ; unsigned divide
        xchg    eax,edx
        xor     edx,edx
        jmp     short @__llmod@finish

;__llmod        ENDP


; ------------------------------------------------------------------------------
;   64-bit unsigned modulo
; ------------------------------------------------------------------------------
;  Dividend(EAX:EDX), Divisor([ESP+8]:[ESP+4])  ; before reg pushing

__llumod:

        push    ebp
        push    ebx
        push    esi
        push    edi

;       dividend is pushed last, therefore the first in the args
;       divisor next.
;
        mov     ebx,[esp+20]            ; get the first low word
        mov     ecx,[esp+24]            ; get the first high word

        or      ecx,ecx
        jnz     @__llumod@slow_ldiv     ; both high words are zero

        or      edx,edx
        jz      @__llumod@quick_ldiv

        or      ebx,ebx
        jz      @__llumod@quick_ldiv    ; if ecx:ebx == 0 force a zero divide
                                        ; we don't expect this to actually
                                        ; work

@__llumod@slow_ldiv:

        mov     ebp,ecx
        mov     ecx,64                  ; shift counter
;
;       Now the stack looks something like this:
;
;               24[esp]: divisor (high dword)
;               20[esp]: divisor (low dword)
;               16[esp]: return EIP
;               12[esp]: previous EBP
;                8[esp]: previous EBX
;                4[esp]: previous ESI
;                 [esp]: previous EDI
;
        xor     edi,edi                 ; fake a 64 bit dividend
        xor     esi,esi                 ;
@__llumod@xloop:
        shl     eax,1                   ; shift dividend left one bit
        rcl     edx,1
        rcl     esi,1
        rcl     edi,1
        cmp     edi,ebp                 ; dividend larger?
        jb      @__llumod@nosub
        ja      @__llumod@subtract
        cmp     esi,ebx                 ; maybe
        jb      @__llumod@nosub
@__llumod@subtract:
        sub     esi,ebx
        sbb     edi,ebp                 ; subtract the divisor
        inc     eax                     ; build quotient
@__llumod@nosub:
        loop    @__llumod@xloop
;
;       When done with the loop the four registers values' look like:
;
;       |     edi    |    esi     |    edx     |    eax     |
;       |        remainder        |         quotient        |
;

        mov     eax,esi
        mov     edx,edi                 ; use remainder

@__llumod@finish:
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret     8

@__llumod@quick_ldiv:
        div     ebx                     ; unsigned divide
        xchg    eax,edx
        xor     edx,edx
        jmp     short @__llumod@finish

;__llumod   ENDP

; ------------------------------------------------------------------------------
;   64-bit shift left
; ------------------------------------------------------------------------------

;
; target (EAX:EDX) count (ECX)
;
__llshl:

        cmp     cl, 32
        jl      @__llshl@below32

        cmp     cl, 64
        jl      @__llshl@below64

        xor     edx, edx
        xor     eax, eax
        ret

@__llshl@below64:

        mov     edx, eax
        shl     edx, cl
        xor     eax, eax
        ret

@__llshl@below32:

        shld    edx, eax, cl
        shl     eax, cl
        ret

;__llshl        ENDP

; ------------------------------------------------------------------------------
;   64-bit signed shift right
; ------------------------------------------------------------------------------
; target (EAX:EDX) count (ECX)

__llshr:

        cmp     cl, 32
        jl      @__llshr@below32

        cmp     cl, 64
        jl      @__llshr@below64

        sar     edx, 1fh
        mov     eax,edx
        ret

@__llshr@below64:

        mov     eax, edx
        cdq
        sar     eax,cl
        ret

@__llshr@below32:

        shrd    eax, edx, cl
        sar     edx, cl
        ret

;__llshr        ENDP

; ------------------------------------------------------------------------------
;   64-bit unsigned shift right
; ------------------------------------------------------------------------------

; target (EAX:EDX) count (ECX)
__llushr:

        cmp     cl, 32
        jl      @__llushr@below32

        cmp     cl, 64
        jl      @__llushr@below64

        xor     edx, edx
        xor     eax, eax
        ret

@__llushr@below64:

        mov     eax, edx
        xor     edx, edx
        shr     eax, cl
        ret

@__llushr@below32:

        shrd    eax, edx, cl
        shr     edx, cl
        ret
