JP0     EQU 0100H
JR0     EQU JP0+07FH
JP1     EQU JR0+0200H
JR1     EQU JP1-080H+02H

;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD HL,1234H     ; expect PC NC NC NC NC NC NC 12 34 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        jp (HL)         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org 1234H
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

