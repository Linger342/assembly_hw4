; macro-b.asm 		;从属于macro-a.asm，子程序
public make1                   	;定义make1子程序为公共类型
extrn x:word                    	;引入macro-a中的x
include macro.asm               	;宏库

codeseg segment  ;代码段名类别相同
	assume cs:codeseg

make1 proc far                	;子程序：键盘输入、形成十六进制
	inc bx
	cmp bx,4                 	
	jg exit
	input                   	;宏input,键盘输入十六进制数
	cmp al,0dh              ;回车？
	jz exit
	cmp al,'0'                 ;十六进制，判断是否0-9/A-F/a-f
	jl out1                     	;其它字符,跳转至out1段
	cmp al,'9'
	jle smal1
	cmp al,'A'
	jl out1
	cmp al,'F'
	jle smal2
	cmp al,'a'
	jl out1
	cmp al,'f'
	jg out1
	sub al,20h         	;a～f减去57h
	smal2:           	;A～F减去37h
	sub al,7        
	smal1:         	;0-9减去30h
	sub al,30h
	mov ah,0        
	xchg ax,x           	;形成十六进制数
	mov cx,16
	mul cx    
	add x,ax            	;保存ax寄存器的值在macro-a中的x
	jmp make1
	exit:ret
out1:
	retsys                       ;宏retsys,结束、返回DOS

make1 endp
codeseg ends
end                           