;macro.mac 

input macro                    	;宏input，键盘输入一个字符
mov ah,01H
int 21h
endm

output macro opr1                ;宏output，显示一个字符
mov dl,opr1
mov ah,02h
int 21h
endm

retsys macro                    	;宏retsys，结束、返回DOS
mov ah,4ch
int 21h
endm

key_str macro opr1            	;宏key_str，键盘输入一串字符
mov dx,offset opr1
mov ah,10
int 21h
endm

display macro opr1           	;宏display，显示一串字符
lea dx,opr1
mov ah,9
int 21h
endm

divis macro opr1                 	
mov cx,opr1    
div cx                        	;ax除以cx,商在ax,余数在dx
mov bx,dx                        	;保存余数
mov si,ax                        	;ax部分商作为位移量
mov dl, dectab[si]            	
mov ah,2                        	;显示部分商
int 21h            
mov ax,bx                        	;余数->ax
mov dx,0
endm        