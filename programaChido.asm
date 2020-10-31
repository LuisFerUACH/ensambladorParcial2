;;librerias para E/S nativas de VC++
includelib libcmt.lib
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
extrn scanf : proc
extrn printf : proc

.data
    cod_sal DQ 0
    msg1 DB "HOLA MUNDO" ,0
    msg2 DB 15 dup(' ')
    msgAntes DB "Texto original: ",0 
    msgDespues DB "  -  Texto modificado: ", 0 
	var3 DQ 10 ;;Longitud del string
.code
main proc
    mov rcx, var3
    lea rdx, msg1
    lea r8, msg2
    sub rsp, 32
    call cambiar
    sub rsp, 32

    lea rcx, msgAntes
    sub rsp ,32
    call printf
    add rsp ,32

    lea rcx , msg1
    sub rsp ,32
    call printf
    add rsp ,32

    lea rcx , msgDespues
    sub rsp ,32
    call printf
    add rsp ,32

    lea rcx , msg2
    sub rsp ,32
    call printf
    add rsp ,32


    mov rax , cod_sal
	call scanf
    ret
main endp

cambiar proc
    ciclo:
        mov BL, byte ptr[rdx]
        mov byte ptr[r8], BL
        cmp byte ptr[rdx], 'O';;Comparamos cada iteracion para ver si es igual a O.
        je lowerO ;;Va a lowerO si se cumple la condicion o salta si es cero.
        cmp byte ptr[rdx], 'A';;Comparamos cada iteracion para ver si es igual a A.
        je lowerA;;Va a lowerA si se cumple la condicion o salta si es cero.
        jmp continuar
    lowerO:
        mov byte ptr[r8], 'o';;Remplazamos por una o en minuscula
        jmp continuar
    lowerA:
        mov byte ptr[r8], 'a';;Remplazamos por una a en minuscula
        jmp continuar
    continuar:
        inc rdx
        inc r8
    loop ciclo
    ret
cambiar endp

end
