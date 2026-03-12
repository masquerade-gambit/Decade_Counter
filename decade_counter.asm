; -------------------------------------------------------
; 8085 Program: Decade Counter (0–9) on 7-Segment Display
; -------------------------------------------------------

ORG 2000H

START:  MVI A,80H        ; Initialize control word for 8255
        OUT 03H

        MVI D,09H        ; Counter for 10 digits (0–9)
        LXI H,2600H      ; HL points to look-up table

LOOP:   MOV A,M          ; Load 7-segment code from memory
        OUT 00H          ; Send to output port

        CALL DELAY       ; Wait so digit is visible

        INR L            ; Move to next table entry
        DCR D            ; Decrease digit counter

        JNZ LOOP         ; Repeat until 10 digits done
        JMP START        ; Restart counting


; ---------------------------
; Delay Subroutine (~2500)
; ---------------------------

DELAY:  MVI B,0FFH

L2:     MVI C,0FFH

L1:     DCR C
        JNZ L1

        DCR B
        JNZ L2

        RET


; -----------------------------------------
; 7-Segment Display Look-Up Table (0 – 9)
; -----------------------------------------

ORG 2600H

DB 0C0H     ; 0
DB 0F9H     ; 1
DB 0A4H     ; 2
DB 0B0H     ; 3
DB 099H     ; 4
DB 092H     ; 5
DB 082H     ; 6
DB 0F8H     ; 7
DB 080H     ; 8
DB 090H     ; 9

END
