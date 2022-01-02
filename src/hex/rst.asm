JP0     EQU 0100H
JR0     EQU JP0+07FH
JP1     EQU JR0+0200H
JR1     EQU JP1-080H+02H
;CALL0   EQU 0004H

RST0    EQU  0H
RST8    EQU  8H
RST10   EQU 10H
RST18   EQU 18H
RST20   EQU 20H
RST28   EQU 28H
RST30   EQU 30H
RST38   EQU 38H

;                       ;        PC A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L' SP   IX   IY   R  I  IFF IFF2
        ; for first line; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

        org RST0
        CALL CALL1      ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

CALL0:
        org 01234H
CALL1:
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RST 38H         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFB NC   NC   NC NC NC  NC
CALL1_0:

        org RST38
        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

        org CALL1_0
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC  NC   NC   NC NC NC  NC
        ret             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

        ORG CALL0
        CALL CALL11     ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC
CALL10:
        org 003234H
CALL11:
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RST 8H         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFB NC   NC   NC NC NC  NC

CALL11_0:
        org RST8
        RST 30h         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFF9 NC   NC   NC NC NC  NC
CALL12:

        org RST30
        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFB NC   NC   NC NC NC  NC

        org CALL12
        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

        org CALL11_0
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC  NC   NC   NC NC NC  NC
        RST 10H         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFB NC   NC   NC NC NC  NC
CALLA:


        org RST10
        RST 28H         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFF9 NC   NC   NC NC NC  NC
RST10_:

        org RST28
        RST 20H         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFF7 NC   NC   NC NC NC  NC

RST28_:

        org RST20
        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFF9 NC   NC   NC NC NC  NC

        org RST28_
        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFB NC   NC   NC NC NC  NC

        org RST10_
        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

        org CALLA
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        RST 18H         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFB NC   NC   NC NC NC  NC

CALLAAA:

        org RST18
        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC

        org CALLAAA
        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

        org CALL10
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

;        org RST18
;        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
;        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC
;        HALT            ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC   NC   NC   NC NC NC  NC

      
 

        org 5000H 
CALL13:
        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC



        org CALL1_0
        NOP             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC  NC   NC   NC NC NC  NC
        ret             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFF NC   NC   NC NC NC  NC

;        RST 10H         ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFF7 NC   NC   NC NC NC  NC


 ;;;;
;        org RST38
;        RET             ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFD NC   NC   NC NC NC  NC
;        RST 8H          ; expect PC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC NC FFFB NC   NC   NC NC NC  NC
 