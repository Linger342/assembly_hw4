;macro-a.asm  	 		;Զ�̵���ģ�黯���򡣴Ӽ�������4λʮ����������ת����ʮ��������ʾ����
extrn make1:far               		;�ⲿ����˵��,make1�ӳ�����Զ�̵�
public x                        		;����xΪ��������, macro-b.asmҪ����
include macro.asm              		

dataseg segment 
x dw 0
mess1 db 0dh,0ah,'input HEX=$'
mess2 db 0dh,0ah,'out dec=$'
dectab db '0123456789'
dataseg ends

stackseg segment stack   		;��ջ��
	dw 100h dup(0)
	top dw ?                       	;ջ��
stackseg ends

codeseg segment para'code'           	;������������ͬ
assume cs:codeseg,ds:dataseg,ss:stackseg
start:
	mov ax,dataseg
	mov ds,ax
	mov ax,stackseg                 	;��ջ�ζε�ַ��SS
	mov ss,ax
	mov sp,offset top                   ;ջָ��SPָ��ջ�ף�����
;������make0
make0 proc far
	mov x,0
	display mess1                    	;��display,��ʾ��ʾ1
	mov bx,0
	call make1                    	;���ӳ���1
	call make2                    	;���ӳ���2
	jmp make0
make0 endp

;�ӳ���make2�������ʾʮ����
make2 proc
	display mess2                    	;��display,��ʾ��ʾ2
	mov ax,x                       	;ȡ����������x
	mov dx,0
	divis 10000                     	;��divis�������õ��̲���ʾ
	divis 1000                    	
	divis 100                        	
	divis 10
	divis 1
	ret
make2 endp

codeseg  ends
end start                       