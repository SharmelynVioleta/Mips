 # Escribir un programa que pida al usuario dos números y muestre por pantalla su división. Si el divisor es   cero el programa debe mostrar un error.

.data
    msg1: .asciiz "\nIngrese un numero: "
    msg2: .asciiz "\nIngrese otro numero: "    
    msg3: .asciiz "\nLa division es: "
    msg4: .asciiz "\nError: "

.text

    # imprimimos el primer mensaje
    main:
    li $v0,4
    la $a0,msg1
    syscall

    # recibimos el ingreso del usuario en $f1
    li $v0,6
    syscall
    mov.s $f1, $f0

    # imprimimos el segundo mensaje    
    li $v0,4
    la $a0,msg2
    syscall

    # recibimos el ingreso del usuario en $f2
    li $v0,6
    syscall
    mov.s $f2, $f0

 # comparamos si f2 es 0
beq $f2, $0, Else 
    
    j Else

    div.s $f12, $f1, $f2

    li $v0,4
    la $a0,msg3
    syscall
    j Endif
    
    # imprimir float
    li $v0,2
    syscall
    
Else:
    # imprimimos     
    li $v0,4
    la $a0,msg4
    syscall
    Endif:
 
    li $v0,10
    syscall



