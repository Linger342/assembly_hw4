;macro.mac 

input macro                    	;��input����������һ���ַ�
mov ah,01H
int 21h
endm

output macro opr1                ;��output����ʾһ���ַ�
mov dl,opr1
mov ah,02h
int 21h
endm

retsys macro                    	;��retsys������������DOS
mov ah,4ch
int 21h
endm

key_str macro opr1            	;��key_str����������һ���ַ�
mov dx,offset opr1
mov ah,10
int 21h
endm

display macro opr1           	;��display����ʾһ���ַ�
lea dx,opr1
mov ah,9
int 21h
endm

divis macro opr1                 	
mov cx,opr1    
div cx                        	;ax����cx,����ax,������dx
mov bx,dx                        	;��������
mov si,ax                        	;ax��������Ϊλ����
mov dl, dectab[si]            	
mov ah,2                        	;��ʾ������
int 21h            
mov ax,bx                        	;����->ax
mov dx,0
endm        