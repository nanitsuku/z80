;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD SP,0102H     ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 0102 NC   NC   NC NC NC  NC
        LD B,12H        ; expect PC NC 12 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,34H        ; expect PC NC NC 34 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,030H       ; expect PC 30 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC       
        PUSH BC         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 0100 NC   NC   NC NC NC  NC
        POP AF          ; expect PC 12 NC NC NC NC 34 NC NC NC NC NC NC NC NC NC NC 0102 NC   NC   NC NC NC  NC
        POP DE          ; expect PC NC NC NC 57 56 NC NC NC NC NC NC NC NC NC NC NC 0104 NC   NC   NC NC NC  NC
        PUSH BC         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 0102 NC   NC   NC NC NC  NC
        LD A,(0102H)    ; expect PC 34 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 0102 NC   NC   NC NC NC  NC
        LD A,(0103H)    ; expect PC 12 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 0102 NC   NC   NC NC NC  NC
        PUSH AF         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 0100 NC   NC   NC NC NC  NC
        POP BC          ; expect PC NC RA RF NC NC NC NC NC NC NC NC NC NC NC NC NC 0102 NC   NC   NC NC NC  NC
        PUSH DE         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 0100 NC   NC   NC NC NC  NC
        POP BC          ; expect PC NC RD RE NC NC NC NC NC NC NC NC NC NC NC NC NC 0102 NC   NC   NC NC NC  NC
        POP HL          ; expect PC NC NC NC NC NC NC 12 34 NC NC NC NC NC NC NC NC 0104 NC   NC   NC NC NC  NC
        PUSH HL         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 0102 NC   NC   NC NC NC  NC
        POP AF          ; expect PC RH NC NC NC NC RL NC NC NC NC NC NC NC NC NC NC 0104 NC   NC   NC NC NC  NC


        HALT

        org 0102H
        defb 56H
        defb 57H

