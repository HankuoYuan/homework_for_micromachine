ORG 0000H
AJMP START
ORG 0030H
START:
    MOV PSW,#00H 
    MOV SP,#53H
    MOV R1,#9
    MOV A,#1
    MOV R0,#20H
INITLOOP:
    MOV @R0,A
    INC R0
    INC A
    DJNZ R1,INITLOOP
    MOV TMOD,#20H
    MOV TL1,#0FDH
    MOV TH1,#0FDH
    MOV SCON,#80H
    SETB TR1
    MOV R0,#20H
    MOV R1,#9
LOOP:
    MOV A,@R0
    MOV SBUF,A
    AJMP CONT
CONT:
    JNB TI,CONT
    CLR TI
    INC R0
    ACALL DELAY
    DJNZ R1,LOOP
    AJMP ALLSTOP
ALLSTOP:
    AJMP ALLSTOP;
DELAY: MOV R2,#30H ;长延时
    ACALL DELAY0 
    RET 
DELAY0: PUSH 02H ;延时子程序
DELAY1: PUSH 02H 
DELAY2: PUSH 02H 
DELAY3: DJNZ R2,DELAY3 
    POP 02H 
    DJNZ R2,DELAY2 
    POP 02H 
    DJNZ R2,DELAY1 
    POP 02H 
    DJNZ R2,DELAY0 
    RET
END