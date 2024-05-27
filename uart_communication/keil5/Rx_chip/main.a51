ORG 0000H
AJMP START
ORG 0030H
START:
    MOV TMOD,#20H;配置定时器
    MOV TL1,#0FDH
    MOV TH1,#0FDH
    MOV SCON,#90H;配置串口
    SETB TR1
LOOP:
    JBC RI,RECE;判断接收标志
    SJMP LOOP     ; 若未接收到数据则继续查询
RECE:
    MOV A, SBUF   ; 读取SBUF中的数据到累加器A
    MOV P2,A     ; 将接收到的数据输出到P2口
    CLR RI        ; 清除RI标志位，如果必要的话
    AJMP LOOP
END