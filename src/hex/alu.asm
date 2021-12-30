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
        ADD A,(HL)      ; expect PC BB NC NC NC NC A8 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,A         ; expect PC 76 NC NC NC NC 3D NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        ADC A,B         ; expect PC 89 NC NC NC NC AC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADC A,C         ; expect PC BD NC NC NC NC A8 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADC A,D         ; expect PC 02 NC NC NC NC 39 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADC A,E         ; expect PC 59 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADC A,H         ; expect PC E2 NC NC NC NC B8 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADC A,L         ; expect PC 8C NC NC NC NC A9 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADC A,0BCH      ; expect PC 49 NC NC NC NC 3D NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADC A,B         ; expect PC 5C NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADC A,(HL)      ; expect PC 05 NC NC NC NC 39 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADC A,A         ; expect PC 0B NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        SUB B           ; expect PC F9 NC NC NC NC AB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB C           ; expect PC C5 NC NC NC NC AA NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB D           ; expect PC 80 NC NC NC NC AA NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB E           ; expect PC 2A NC NC NC NC 3E NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB H           ; expect PC A1 NC NC NC NC AF NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB L           ; expect PC F7 NC NC NC NC BB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB 0BCH        ; expect PC 3B NC NC NC NC 3A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB B           ; expect PC 29 NC NC NC NC 2A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB (HL)        ; expect PC 80 NC NC NC NC AF NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SUB A           ; expect PC 00 NC NC NC NC 6A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        SBC A,B         ; expect PC EE NC NC NC NC BB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SBC A,C         ; expect PC B9 NC NC NC NC AA NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SBC A,D         ; expect PC 74 NC NC NC NC 2E NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SBC A,E         ; expect PC 1E NC NC NC NC 3A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SBC A,H         ; expect PC 95 NC NC NC NC AF NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SBC A,L         ; expect PC EA NC NC NC NC BB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SBC A,0BCH      ; expect PC 2D NC NC NC NC 3A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SBC A,B         ; expect PC 1B NC NC NC NC 2A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SBC A,(HL)      ; expect PC 72 NC NC NC NC 2B NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        SBC A,A         ; expect PC FF NC NC NC NC BB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        AND B           ; expect PC 12 NC NC NC NC 3C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND C           ; expect PC 10 NC NC NC NC 38 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND D           ; expect PC 00 NC NC NC NC 7C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND E           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND H           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND L           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND 0BCH        ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND B           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND (HL)        ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND A           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        XOR B           ; expect PC 12 NC NC NC NC 2C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR C           ; expect PC 26 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR D           ; expect PC 63 NC NC NC NC 2C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR E           ; expect PC 35 NC NC NC NC 2C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR H           ; expect PC BC NC NC NC NC A8 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR L           ; expect PC 16 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR 0BCH        ; expect PC AA NC NC NC NC AC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR B           ; expect PC B8 NC NC NC NC AC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR (HL)        ; expect PC 11 NC NC NC NC 2C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR A           ; expect PC 00 NC NC NC NC 6C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        OR B            ; expect PC 12 NC NC NC NC 2C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR C            ; expect PC 36 NC NC NC NC 2C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR D            ; expect PC 77 NC NC NC NC 2C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR E            ; expect PC 77 NC NC NC NC 2C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR H            ; expect PC FF NC NC NC NC AC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR L            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR 0BCH         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR B            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR (HL)         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR A            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        CP B            ; expect PC FF NC NC NC NC AA NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP C            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP D            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP E            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP H            ; expect PC NC NC NC NC NC 2A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP L            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP 0BCH         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP B            ; expect PC NC NC NC NC NC AA NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP (HL)         ; expect PC NC NC NC NC NC 2A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP A            ; expect PC NC NC NC NC NC 6A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        LD A,055H       ; expect PC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND 055H        ; expect PC 55 NC NC NC NC 3C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        AND 0AAH        ; expect PC 00 NC NC NC NC 7C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
 
        LD A,055H       ; expect PC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR 0AAH         ; expect PC FF NC NC NC NC AC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        
        LD A,055H       ; expect PC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR 0AAH        ; expect PC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        XOR 0FFH        ; expect PC 00 NC NC NC NC 6C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD A,055H       ; expect PC 55 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP 0AAH         ; expect PC NC NC NC NC NC BF NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP 00H          ; expect PC NC NC NC NC NC 2A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CP 055H         ; expect PC NC NC NC NC NC 6A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC


        
        
        HALT
        
        org 89AAH
        defb 0A9H