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
    MOV R6,#02H    ; 初始化循环计数器
    MOV R0,#20H   ; 初始化数据缓冲区指针
    MOV SCON,#10H ;
    MOV IE,#90H
LOOP:
    SJMP LOOP     ; 若未接收到数据则继续查询
RECE:
    MOV A, SBUF   ; 读取SBUF中的数据到累加器A
    MOV P2,A     ; 将接收到的数据输出到P2口
    ; 这里可以添加对R0和R6的操作，如果需要连续接收并存储数据
    CLR RI        ; 清除RI标志位，如果必要的话
    ;INC R0       ; 增加数据指针，如果存储数据到内存
    AJMP LOOP
ALLSTOP:
    AJMP ALLSTOP  ; 无限循环保持程序运行

END