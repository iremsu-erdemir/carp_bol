;Girilen iki sayıyı birbiriyle bölme ve çarpma.
code segment
main proc far
assume cs:code,ds:code 
mov ax,0
push ds ax
mov ax,code
mov ds,ax
jmp basla

m1 db 10,13,'Birinci sayiyi giriniz:$'
m2 db 10,13,'İkinci sayiyi giriniz:$'
m3 db 10,13,'Carpma sonucu:$'
m4 db 10,13,'Bolme sonucu(Bolum):$'
m5 db 10,13,'Bolme sonucu(Kalan):$'
sayi1 db ?
sayi2 db ?
carpim dw ?
bolum db ?
kalan db ?

basla: mov ah,09h
	lea dx,m1
	int 21h

	mov ah,01h
	int 21h
	sub al,30h
	mov sayi1,al

	mov ah,09h
	lea dx,m2
	int 21h

	mov ah,01h
	int 21h
	sub al,30h
	mov sayi2,al

	mov ah,0
	mov al,sayi1
	mov bl,sayi2
	
	mul bl    
	aam
	mov carpim,ax
	
	mov ah,0
	mov al,sayi1
	mov bl,sayi2
	
	div bl
	
	mov bolum,al
	mov kalan,ah

	mov ah,09h
	lea dx,m3
	int 21h
	
	mov bx,carpim

	mov ah,02h
	mov dl,bh
	add dl,30h
	int 21h
	
	mov ah,02h
	mov dl,bl
	add dl,30h
	int 21h

	mov ah,09h
	lea dx,m4
	int 21h

	mov ah,02h
	mov dl,bolum
	add dl,30h
	int 21h

	mov ah,09h
	lea dx,m5
	int 21h
	
	mov ah,02h
	mov dl,kalan
	add dl,30h
	int 21h

ret
main endp
code ends
end
	
	
	



