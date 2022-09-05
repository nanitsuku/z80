;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD B,00H        ; expect PC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,00H        ; expect PC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC BC          ; expect PC NC 00 01 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD B,00H        ; expect PC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,0FFH       ; expect PC NC NC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC BC          ; expect PC NC 01 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        DEC BC          ; expect PC NC 00 FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD B,00H        ; expect PC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,00H        ; expect PC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC BC          ; expect PC NC FF FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD D,00H        ; expect PC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,00H        ; expect PC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC DE          ; expect PC NC NC NC 00 01 NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD D,00H        ; expect PC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,0FFH       ; expect PC NC NC NC NC FF NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC DE          ; expect PC NC NC NC 01 00 NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        DEC DE          ; expect PC NC NC NC 00 FF NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD D,00H        ; expect PC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,00H        ; expect PC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC DE          ; expect PC NC NC NC FF FF NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD H,00H        ; expect PC NC NC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,00H        ; expect PC NC NC NC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC HL          ; expect PC NC NC NC NC NC NC 00 01 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD H,00H        ; expect PC NC NC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0FFH       ; expect PC NC NC NC NC NC NC NC FF NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        INC HL          ; expect PC NC NC NC NC NC NC 01 00 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        DEC HL          ; expect PC NC NC NC NC NC NC 00 FF NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD H,00H        ; expect PC NC NC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,00H        ; expect PC NC NC NC NC NC NC NC 00 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DEC HL          ; expect PC NC NC NC NC NC NC FF FF NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD  SP,0200H    ; expect PC NC NC NC NC NC NC FF FF NC NC NC NC NC NC NC NC 0200 NC   NC   NC NC NC  NC
        DEC SP          ; expect PC NC NC NC NC NC NC FF FF NC NC NC NC NC NC NC NC 01FF NC   NC   NC NC NC  NC
        INC SP          ; expect PC NC NC NC NC NC NC FF FF NC NC NC NC NC NC NC NC 0200 NC   NC   NC NC NC  NC

        HALT