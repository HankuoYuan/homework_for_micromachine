ORG 0000H
AJMP START
ORG 0030H
START:
    MOV TMOD,#20H;���ö�ʱ��
    MOV TL1,#0FDH
    MOV TH1,#0FDH
    MOV SCON,#90H;���ô���
    SETB TR1
LOOP:
    JBC RI,RECE;�жϽ��ձ�־
    SJMP LOOP     ; ��δ���յ������������ѯ
RECE:
    MOV A, SBUF   ; ��ȡSBUF�е����ݵ��ۼ���A
    MOV P2,A     ; �����յ������������P2��
    CLR RI        ; ���RI��־λ�������Ҫ�Ļ�
    AJMP LOOP
END