.data
    msg1: .asciiz "\n¿Cuál es tu renta anual? "
    msg2: .asciiz "\nTIenes que pagar "
    valor1: .word 9999

.text
main:
    # print_str
    li $v0, 4
    la $a0, msg1
    syscall

    # Ingreso de usuario 
    li $v0, 5
    syscall
    move $t0, $v0

    # $t1 = 0 + 0 = 0
    add $t1,$zero ,0

    # Carga en memoria  os valores
    lw $t2,valor1 

    # comprueba la condición 
    bge $t2,$t0, Paga

    j Final
    
    Paga:
        li $v0, 4
        la $a0, msg2
        syscall
        j Final

    Final:
        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        syscall

    li $v0,10
    syscall