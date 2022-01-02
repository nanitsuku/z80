JP0     EQU 0100H
JR0     EQU JP0+07FH
JP1     EQU JR0+0200H
JR1     EQU JP1-080H+02H
CALL0   EQU 0004H

;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ;               ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL CALL1      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC
CALL2:

        org CALL2+100H
CALL1:
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ret             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

       org CALL2
       CALL NC,CALL1    ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
       CALL C,CALL3     ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

CALL4:

       org CALL1+200H
CALL3:
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RET NC          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL CALL5      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFB NC   NC   NC NC NC  NC
CALL6:
        org CALL1+300H
CALL5:
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ret C           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

        org CALL6
        ret             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

        org CALL4
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        XOR A           ; expect PC 00 NC NC NC NC 6C NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        CALL C,CALL7    ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL NC,CALL7   ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

CALL8:
        org CALL1+400H
CALL7:
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ret C           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        ret NC          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

        org CALL8
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL NZ,CALL9   ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL Z,CALL9    ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

CALL10:

        org CALL1+500H
CALL9:
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RET NZ          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RET Z           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

        org CALL10
        INC A           ; expect PC 01 NC NC NC NC 28 NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL Z,CALL11   ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL NZ,CALL11  ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

CALL12:
        org CALL1+600H
CALL11:
        RET Z           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RET NZ          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

        org CALL12
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL M,CALL13   ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL P,CALL13   ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

CALL14:
        org CALL1+700H
CALL13:
        RET M           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RET P           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

        org CALL14
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR 01H          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL PE,CALL15  ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL PO,CALL15  ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

CALL16:

        org CALL1+800H
CALL15:
        RET PE          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RET PO          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

        org CALL16
        DEC A           ; expect PC 00 NC NC NC NC 6A NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        OR 0FFH         ; expect PC FF NC NC NC NC AC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL PO,CALL17  ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL PE,CALL17  ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

CALL18:

        org CALL1+900H
CALL17:
        RET PO          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RET PE          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC


        org CALL18
        CALL P,CALL20   ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        CALL M,CALL20   ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

CALL20:

        org CALL1+0A00H
CALL19:
        RET P           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RET M           ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

        org CALL20
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC


;        ret             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC