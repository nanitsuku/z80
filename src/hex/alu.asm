;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,030H       ; expect PC 30 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC       
        LD B,12H        ; expect PC NC 12 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,34H        ; expect PC NC NC 34 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,45H        ; expect PC NC NC NC 45 NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,56H        ; expect PC NC NC NC NC 56 NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,89H        ; expect PC NC NC NC NC NC NC 89 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0AAH       ; expect PC NC NC NC NC NC NC NC AA NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,B         ; expect PC 42 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,C         ; expect PC 76 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,D         ; expect PC bb NC NC NC NC AC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,E         ; expect PC 11 NC NC NC NC 39 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,H         ; expect PC 9A NC NC NC NC A8 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,L         ; expect PC 44 NC NC NC NC 3D NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,0BCH      ; expect PC 00 NC NC NC NC 79 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,B         ; expect PC 12 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,(HL)      ; expect PC BB NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        HALT

        org 89AAH
        defb 0A9H
