;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD A,00H        ; expect PC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC A           ; expect PC 01 NC NC NC NC 29 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC A           ; expect PC 00 NC NC NC NC 6B NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC A           ; expect PC FF NC NC NC NC BB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC A           ; expect PC 00 NC NC NC NC 79 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD B,00H        ; expect PC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC B           ; expect PC NC 01 NC NC NC 29 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC B           ; expect PC NC 00 NC NC NC 6B NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC B           ; expect PC NC FF NC NC NC BB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC B           ; expect PC NC 00 NC NC NC 79 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD C,00H        ; expect PC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC C           ; expect PC NC NC 01 NC NC 29 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC C           ; expect PC NC NC 00 NC NC 6B NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC C           ; expect PC NC NC FF NC NC BB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC C           ; expect PC NC NC 00 NC NC 79 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD D,00H        ; expect PC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC D           ; expect PC NC NC NC 01 NC 29 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC D           ; expect PC NC NC NC 00 NC 6B NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC D           ; expect PC NC NC NC FF NC BB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC D           ; expect PC NC NC NC 00 NC 79 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD E,00H        ; expect PC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC E           ; expect PC NC NC NC NC 01 29 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC E           ; expect PC NC NC NC NC 00 6B NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC E           ; expect PC NC NC NC NC FF BB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC E           ; expect PC NC NC NC NC 00 79 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD H,00H        ; expect PC NC NC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC H           ; expect PC NC NC NC NC NC 29 01 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC H           ; expect PC NC NC NC NC NC 6B 00 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC H           ; expect PC NC NC NC NC NC BB FF NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC H           ; expect PC NC NC NC NC NC 79 00 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD L,00H        ; expect PC NC NC NC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC L           ; expect PC NC NC NC NC NC 29 NC 01 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC L           ; expect PC NC NC NC NC NC 6B NC 00 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC L           ; expect PC NC NC NC NC NC BB NC FF NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC L           ; expect PC NC NC NC NC NC 79 NC 00 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        XOR A           ; expect PC NC NC NC NC NC 6C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,089H       ; expect PC NC NC NC NC NC NC 89 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0AAH       ; expect PC NC NC NC NC NC NC NC AA NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC (HL)        ; expect PC NC NC NC NC NC 78 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,(HL)       ; expect PC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC (HL)        ; expect PC NC NC NC NC NC BA NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,(HL)       ; expect PC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        HALT            ; expect PC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org 89AAH
        defb 0FFH