.data
    msg0: .asciiz "\n Introduce tu edad "
    msg1: .asciiz "\n El precio de la entrada es "
    valor1: .word 3
    valor2: .word 18

.text
main:
# print str
    li $v0, 4
    la $a0, msg0
    syscall

# ingresa usuario
    li $v0, 5
    syscall
    move $t0, $v0

# Carga en memoria  os valores
    lw $t1,valor1 
    lw $t2,valor2

# t3= 0
    add $t3, $zero, 0

# compara y salta 
    bge $t1, $t0 , PrecioCero
    bge $t2, $t0 , PrecioCuatro

    j else
    PrecioCero:
        add $t3, $t3, 0
        j fin
    PrecioCuatro:
        add $t3, $t3, 4
        j fin
    else:
        add $t3, $t3, 10
        j fin
    fin:
        li $v0, 4
        la $a0, msg1
        syscall

# precio entrada 
        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 10
        syscall