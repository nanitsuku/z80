JP0     EQU 0100H
JR0     EQU JP0+07FH
JP1     EQU JR0+0200H
JR1     EQU JP1-080H+02H

;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        jp JP0          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org JP0
        jr JR0          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org JR0
        jp JP1          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org JP1
        jr JR1          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org JR1
        JP AAAA         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org JR1+20H
AAAA:
        XOR A           ; expect PC 00 NC NC NC NC 6C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP Z,BBBB       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org AAAA+20H
BBBB:
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP NZ,BBBB      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        inc A           ; expect PC 01 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP Z,BBBB       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP NZ,CCCC      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org BBBB+010H
CCCC:
        JP C,CCCC       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP NC,DDDD      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org CCCC+020H
DDDD:
        ADD A,0FFH      ; expect PC 00 NC NC NC NC 79 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP NC,DDDD      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP C,EEEE       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org DDDD+20H
EEEE:
        ADD A,01H       ; expect PC 01 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP M,EEEE       ; expect PC 01 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP P,FFFF       ; expect PC 01 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org EEEE+20H
FFFF:
        SUB 20H         ; expect PC e1 NC NC NC NC AB NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP P,FFFF       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP M,GGGG       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org FFFF+20H
GGGG:
        XOR A           ; expect PC 00 NC NC NC NC 6C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP PO,GGGG      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP PE,HHHH      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org GGGG+20H
HHHH:
        OR 01H          ; expect PC 01 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP PE,HHHH      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP PO,IIII      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org HHHH+20H
IIII:
        JR Z,IIII       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JR NZ,JJJJ      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org IIII+20H
JJJJ:
        XOR A           ; expect PC 00 NC NC NC NC 6C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JR NZ,JJJJ      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JR Z,KKKK       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org JJJJ+20H
KKKK:
        JR C,KKKK       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JR NC,LLLL      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org KKKK+20H
LLLL:
        INC A           ; expect PC 01 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ADD A,0FFH      ; expect PC 00 NC NC NC NC 79 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        JR NC,LLLL      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JR C,MMMM       ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

 
        org LLLL+20H
MMMM:
        LD B,01H        ; expect PC NC 01 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DJNZ NNNN       ; expect PC NC 00 NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        DJNZ NNNN       ; expect PC NC FF NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        org MMMM+20H
NNNN:
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        LD HL,0ABCDH    ; expect PC NC NC NC NC NC NC AB CD NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        jp (HL)         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org 0ABCDH
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC


        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
;        jr aaa          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

;        org aaa
        org 0401H
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        JP NZ,AAAA      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
