.data
    msg1: .asciiz "\n¿Cuál es tu edad? "
    msg2: .asciiz "\nEres menor de edad. "
    msg3: .asciiz "\nEres mayor de edad. "
.text
main:

    li $v0,4   # print_str
    la $a0,msg1
    syscall 

    # recibimos el ingreso del usuario en $t1
    li $v0,5
    syscall
    move $t0,$v0
    
    # $s1 = 0 + 18 = 18
    addi $s1, $zero, 18 
 
    # si el dato imgresado es mayor  
    slt $t1, $t0, $s1
   
    # si es falso vamos al Else
    beq $t1, $0, Else
    # imprime que es menor de edad
    li $v0,4
    la $a0,msg2
    syscall
    # termina y va al endif
    j Endif
    # si es verdadero imprime es mayor
    Else:
        li $v0,4
        la $a0,msg3
        syscall
    Endif:

    li $v0,10
    syscall