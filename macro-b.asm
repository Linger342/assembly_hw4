; macro-b.asm 		;������macro-a.asm���ӳ���
public make1                   	;����make1�ӳ���Ϊ��������
extrn x:word                    	;����macro-a�е�x
include macro.asm               	;���

codeseg segment  ;������������ͬ
	assume cs:codeseg

make1 proc far                	;�ӳ��򣺼������롢�γ�ʮ������
	inc bx
	cmp bx,4                 	
	jg exit
	input                   	;��input,��������ʮ��������
	cmp al,0dh              ;�س���
	jz exit
	cmp al,'0'                 ;ʮ�����ƣ��ж��Ƿ�0-9/A-F/a-f
	jl out1                     	;�����ַ�,��ת��out1��
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
	sub al,20h         	;a��f��ȥ57h
	smal2:           	;A��F��ȥ37h
	sub al,7        
	smal1:         	;0-9��ȥ30h
	sub al,30h
	mov ah,0        
	xchg ax,x           	;�γ�ʮ��������
	mov cx,16
	mul cx    
	add x,ax            	;����ax�Ĵ�����ֵ��macro-a�е�x
	jmp make1
	exit:ret
out1:
	retsys                       ;��retsys,����������DOS

make1 endp
codeseg ends
end                           