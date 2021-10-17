;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,0FFH       ; expect PC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,0FDH       ; expect PC NC FD NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,0FCH       ; expect PC NC NC FC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,0FBH       ; expect PC NC NC NC FB NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,0FAH       ; expect PC NC NC NC NC FA NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,0F9H       ; expect PC NC NC NC NC NC NC F9 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0F8H       ; expect PC NC NC NC NC NC NC NC F8 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD B,B          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,C          ; expect PC NC RC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,D          ; expect PC NC RD NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,E          ; expect PC NC RE NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,H          ; expect PC NC RH NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,L          ; expect PC NC RL NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,(HL)       ; expect PC NC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,A          ; expect PC NC RA NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD A,0FFH       ; expect PC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,0FDH       ; expect PC NC FD NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,0FCH       ; expect PC NC NC FC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,0FBH       ; expect PC NC NC NC FB NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,0FAH       ; expect PC NC NC NC NC FA NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,0F9H       ; expect PC NC NC NC NC NC NC F9 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0F8H       ; expect PC NC NC NC NC NC NC NC F8 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD C,B          ; expect PC NC NC RB NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,C          ; expect PC NC NC RC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,D          ; expect PC NC NC RD NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,E          ; expect PC NC NC RE NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,H          ; expect PC NC NC RH NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,L          ; expect PC NC NC RL NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,(HL)       ; expect PC NC NC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,A          ; expect PC NC NC RA NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        LD A,0FFH       ; expect PC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,0FDH       ; expect PC NC FD NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,0FCH       ; expect PC NC NC FC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,0FBH       ; expect PC NC NC NC FB NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,0FAH       ; expect PC NC NC NC NC FA NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,0F9H       ; expect PC NC NC NC NC NC NC F9 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0F8H       ; expect PC NC NC NC NC NC NC NC F8 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD D,B          ; expect PC NC NC NC RB NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,C          ; expect PC NC NC NC RC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,D          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,E          ; expect PC NC NC NC RE NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,H          ; expect PC NC NC NC RH NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,L          ; expect PC NC NC NC RL NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,(HL)       ; expect PC NC NC NC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,A          ; expect PC NC NC NC RA NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        LD A,0FFH       ; expect PC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,0FDH       ; expect PC NC FD NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,0FCH       ; expect PC NC NC FC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,0FBH       ; expect PC NC NC NC FB NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,0FAH       ; expect PC NC NC NC NC FA NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,0F9H       ; expect PC NC NC NC NC NC NC F9 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0F8H       ; expect PC NC NC NC NC NC NC NC F8 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD E,B          ; expect PC NC NC NC NC RB NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,C          ; expect PC NC NC NC NC RC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,D          ; expect PC NC NC NC NC RD NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,E          ; expect PC NC NC NC NC RE NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,H          ; expect PC NC NC NC NC RH NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,L          ; expect PC NC NC NC NC RL NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,(HL)       ; expect PC NC NC NC NC 55 NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,A          ; expect PC NC NC NC NC RA NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        LD A,0FFH       ; expect PC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,0FDH       ; expect PC NC FD NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,0FCH       ; expect PC NC NC FC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,0FBH       ; expect PC NC NC NC FB NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,0FAH       ; expect PC NC NC NC NC FA NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,0F9H       ; expect PC NC NC NC NC NC NC F9 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0F8H       ; expect PC NC NC NC NC NC NC NC F8 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD H,B          ; expect PC NC NC NC NC NC NC RB NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,C          ; expect PC NC NC NC NC NC NC RC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,D          ; expect PC NC NC NC NC NC NC RD NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,E          ; expect PC NC NC NC NC NC NC RE NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,H          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,L          ; expect PC NC NC NC NC NC NC RL NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,(HL)       ; expect PC NC NC NC NC NC NC 54 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,A          ; expect PC NC NC NC NC NC NC RA NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        LD A,0FFH       ; expect PC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,0FDH       ; expect PC NC FD NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,0FCH       ; expect PC NC NC FC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,0FBH       ; expect PC NC NC NC FB NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,0FAH       ; expect PC NC NC NC NC FA NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,0F9H       ; expect PC NC NC NC NC NC NC F9 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0F8H       ; expect PC NC NC NC NC NC NC NC F8 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD L,B          ; expect PC NC NC NC NC NC NC NC RB NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,C          ; expect PC NC NC NC NC NC NC NC RC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,D          ; expect PC NC NC NC NC NC NC NC RD NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,E          ; expect PC NC NC NC NC NC NC NC RE NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,H          ; expect PC NC NC NC NC NC NC NC RH NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,L          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,(HL)       ; expect PC NC NC NC NC NC NC NC 60 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,A          ; expect PC NC NC NC NC NC NC NC FF NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD A,0FFH       ; expect PC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD B,0FDH       ; expect PC NC FD NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,0FCH       ; expect PC NC NC FC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD D,0FBH       ; expect PC NC NC NC FB NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD E,0FAH       ; expect PC NC NC NC NC FA NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD H,0F9H       ; expect PC NC NC NC NC NC NC F9 NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD L,0F8H       ; expect PC NC NC NC NC NC NC NC F8 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD A,B          ; expect PC RB NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,C          ; expect PC RC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,D          ; expect PC RD NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,E          ; expect PC RE NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,H          ; expect PC RH NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,L          ; expect PC RL NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,(HL)       ; expect PC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,A          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD (HL),B       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD (HL),C       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD (HL),D       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD (HL),E       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD (HL),H       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD (HL),L       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ; HALT
        LD (HL),A       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        LD BC,8101H     ; expect PC NC 81 01 NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD DE,8202H     ; expect PC NC NC NC 82 02 NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD (8303H),HL   ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD (8404H),A    ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD A,(BC)       ; expect PC 45 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD A,(DE)       ; expect PC 35 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD A,(8707H)    ; expect PC 51 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD HL,(8606H)   ; expect PC NC NC NC NC NC NC 52 53 NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD (HL),0F7H    ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD B,H          ; expect PC NC RH NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        LD C,L          ; expect PC NC NC RL NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD A,(BC)       ; expect PC F7 NC RL NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD SP,HL        ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC 5253 NC   NC   NC NC NC  NC

        HALT

        org 0x5454
        defb 53H

        org 0x55F8
        defb 54H

        org 0x8101
        defb 45H
        defb 46H
        defb 47H

        org 0x8202
        defb 35H
        defb 36H
        defb 37H

        org 0x8606
        defb 53H
        defb 52H

        org 0x8707
        defb 51H
        defb 50H

        org 0xF8F8
        defb 54H

        org 0xF9F8
        defb 55H

        org 0xF9F9
        defb 60H 
