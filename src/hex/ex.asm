;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD    SP,1234H  ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 1234 NC   NC   NC NC NC  NC
        LD    H,0AAH    ; expect PC NC NC NC NC NC NC AA NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD    L,0BBH    ; expect PC NC NC NC NC NC NC NC BB NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        EX    (SP),HL   ; expect PC NC NC NC NC NC NC 56 78 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD    A,(1234H) ; expect PC BB NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD    B,A       ; expect PC NC BB NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD    A,(1235H) ; expect PC AA NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD    DE,0ABCDH ; expect PC NC NC NC AB CD NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        EX    DE,HL     ; expect PC NC NC NC 56 78 NC AB CD NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD    BC,9ABCH  ; expect PC NC 9A BC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        EXX             ; expect PC NC 00 00 00 00 NC 00 00 NC 9A BC 56 78 NC AB CD NC   NC   NC   NC NC NC  NC
        EXX             ; expect PC AA 9A BC 56 78 NC AB CD NC 00 00 00 00 NC 00 00 NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        EX AF,AF'       ; expect PC 00 NC NC NC NC 00 NC NC AA NC NC NC NC FF NC NC NC   NC   NC   NC NC NC  NC
        INC A           ; expect PC 01 NC NC NC NC 28 NC NC AA NC NC NC NC FF NC NC NC   NC   NC   NC NC NC  NC
        AND 55H         ; expect PC NC NC NC NC NC 38 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        EX AF,AF'       ; expect PC AA NC NC NC NC FF NC NC 01 NC NC NC NC 38 NC NC NC   NC   NC   NC NC NC  NC
        HALT
        
        org 1234H
        defw 5678H