;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        ccf             ; expect PC NC NC NC NC NC FC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        scf             ; expect PC NC NC NC NC NC ED NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC


        LD A,55H        ; expect PC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RLCA            ; expect PC AA NC NC NC NC EC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RLCA            ; expect PC 55 NC NC NC NC ED NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RLA             ; expect PC AB NC NC NC NC EC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RLA             ; expect PC 56 NC NC NC NC ED NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD A,55H        ; expect PC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RRCA            ; expect PC AA NC NC NC NC ED NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RRCA            ; expect PC 55 NC NC NC NC EC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RRA             ; expect PC 2A NC NC NC NC ED NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RRA             ; expect PC 95 NC NC NC NC EC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        CPL             ; expect PC 6A NC NC NC NC FE NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        HALT
        
        org 89AAH
        defb 0A9H