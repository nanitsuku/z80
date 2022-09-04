;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD  BC,0123H    ; expect PC NC 01 23 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD  DE,4567H    ; expect PC NC NC NC 45 67 NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD  HL,89ABH    ; expect PC NC NC NC NC NC NC 89 AB NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD  SP,0CDEFH   ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC CDEF NC   NC   NC NC NC  NC

        ADD HL,BC       ; expect PC NC NC NC NC NC EC 8A CE NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD HL,DE       ; expect PC NC NC NC NC NC FC D0 35 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD HL,HL       ; expect PC NC NC NC NC NC ED A0 6A NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD HL,SP       ; expect PC NC NC NC NC NC NC 6E 59 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT