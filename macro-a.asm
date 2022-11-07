;macro-a.asm  	 		;远程调用模块化程序。从键盘输入4位十六进制数，转换成十进制数显示出来
extrn make1:far               		;外部符号说明,make1子程序是远程的
public x                        		;定义x为公共变量, macro-b.asm要引用
include macro.asm              		

dataseg segment 
x dw 0
mess1 db 0dh,0ah,'input HEX=$'
mess2 db 0dh,0ah,'out dec=$'
dectab db '0123456789'
dataseg ends

stackseg segment stack   		;堆栈段
	dw 100h dup(0)
	top dw ?                       	;栈底
stackseg ends

codeseg segment para'code'           	;代码段名类别相同
assume cs:codeseg,ds:dataseg,ss:stackseg
start:
	mov ax,dataseg
	mov ds,ax
	mov ax,stackseg                 	;堆栈段段地址→SS
	mov ss,ax
	mov sp,offset top                   ;栈指针SP指向栈底（顶）
;主程序make0
make0 proc far
	mov x,0
	display mess1                    	;宏display,显示提示1
	mov bx,0
	call make1                    	;调子程序1
	call make2                    	;调子程序2
	jmp make0
make0 endp

;子程序make2：查表，显示十进制
make2 proc
	display mess2                    	;宏display,显示提示2
	mov ax,x                       	;取出公共变量x
	mov dx,0
	divis 10000                     	;宏divis，除法得到商并显示
	divis 1000                    	
	divis 100                        	
	divis 10
	divis 1
	ret
make2 endp

codeseg  ends
end start                       