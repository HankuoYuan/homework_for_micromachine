;ORG 0000H
;AJMP START
;ORG 0030H
;START:
    ;MOV R6,#02H
    ;MOV R0,#20H
    ;MOV SCON,#10H
    ;;MOV 0AFH,#01
    ;;MOV 0ACH,#01
    ;;MOV 09CH,#01
;LOOP:
    ;JBC RI,RECE
    ;SJMP LOOP
;RECE:
    ;;MOV A,SBUF
    ;MOV P2,SBUF
    ;;INC R0
    ;;DJNZ R6,LOOP
    ;AJMP LOOP
;ALLSTOP:
    ;AJMP ALLSTOP;
;END
ORG 0000H
AJMP START
ORG 0023H
AJMP RECE
ORG 0030H
START:
    MOV R6,#02H    ; ��ʼ��ѭ��������
    MOV R0,#20H   ; ��ʼ�����ݻ�����ָ��
    MOV SCON,#10H ;
    MOV IE,#90H
LOOP:
    SJMP LOOP     ; ��δ���յ������������ѯ
RECE:
    MOV A, SBUF   ; ��ȡSBUF�е����ݵ��ۼ���A
    MOV P2,A     ; �����յ������������P2��
    ; ���������Ӷ�R0��R6�Ĳ����������Ҫ�������ղ��洢����
    CLR RI        ; ���RI��־λ�������Ҫ�Ļ�
    ;INC R0       ; ��������ָ�룬����洢���ݵ��ڴ�
    AJMP LOOP
ALLSTOP:
    AJMP ALLSTOP  ; ����ѭ�����ֳ�������

END