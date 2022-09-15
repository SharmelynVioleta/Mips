.data
    msg1: .asciiz "\n¿Cuál es tu renta anual? "
    msg2: .asciiz "\nTIenes que pagar "
    valor1: .word 9999
    valor2: .word 19999
    valor3: .word 34999
    valor4: .word 59999
    divisionValor: .word 100
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
    lw $t3,valor2 
    lw $t4,valor3 
    lw $t5,valor4 
    lw $t6,divisionValor

    # comprueba la condición 
    bge $t2,$t0,Tipo5
    bge $t3,$t0,Tipo15
    bge $t4,$t0,Tipo20
    bge $t5,$t0,Tipo30
    
    # $t1 = 0 + 45 = 45
    add $t1,$zero ,45
    j Final
    
    Tipo5:
        add $t1,$zero ,5
        j Final
    Tipo15:
        add $t1,$zero ,15
        j Final
    Tipo20:
        add $t1,$zero ,20
        j Final
    Tipo30:
        add $t1,$zero,30
        j Final
    
    Final:
        li $v0, 4
        la $a0, msg2
        syscall

        mult $t1, $t0
        mflo $a0

        div $a0, $t6
        mflo $a0

        li $v0, 1
        syscall

    li $v0,10
    syscall