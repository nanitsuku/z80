;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR A           ; expect PC 00 NC NC NC NC 6C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,0AH       ; expect PC 0A NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DAA             ; expect PC 10 NC NC NC NC 38 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,05H       ; expect PC 15 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,05H       ; expect PC 1A NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DAA             ; expect PC 20 NC NC NC NC 38 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,80H       ; expect PC A0 NC NC NC NC A8 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DAA             ; expect PC 00 NC NC NC NC 6D NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,20H       ; expect PC 20 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,90H       ; expect PC B0 NC NC NC NC A8 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DAA             ; expect PC 10 NC NC NC NC 29 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR A           ; expect PC 00 NC NC NC NC 6C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB 60H         ; expect PC A0 NC NC NC NC AB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DAA             ; expect PC 40 NC NC NC NC 2B NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB 05H         ; expect PC 3B NC NC NC NC 3A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DAA             ; expect PC 35 NC NC NC NC 3E NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        HALT
        
        org 89AAH
        defb 0A9H