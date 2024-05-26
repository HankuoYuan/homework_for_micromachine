ORG 0000H
AJMP START
ORG 0030H
START:
    MOV R1,#02H
    MOV R0,#20H
    MOV 20H,#05H
    MOV 21H,#055H
    MOV SCON,#00H
    ;MOV 0AFH,#01
    ;MOV 0ACH,#01
SEND:
    MOV A,@R0
    MOV SBUF,A
WAIT:
    JNB TI,WAIT
    CLR TI
    ;INC R0
    ACALL DELAY
    ;DJNZ R1,SEND
    AJMP SEND
ALLSTOP:
    AJMP ALLSTOP;
DELAY:
    MOV R4,#20;1us  12mHZ ����ʱ������Ϊ1us
DEL1:
    MOV R6,#100;1us T=(1+1+1+((250*2+2)*100+2)*20+2)=1004050us  1s
DEL2:
    MOV    R7,#250;1us
    DJNZ    R7,$;2us   ѭ��250�� ���������2΢�룬һ����������
    DJNZ    R6,DEL2;2us   ÿ�μ�1��������0����ת������伴Ϊ��Del1����䣬ѭ��100��
    DJNZ    R4,DEL1;2us   ѭ��20��
    RETI     ;2us
END