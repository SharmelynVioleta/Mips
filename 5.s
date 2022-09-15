.data
    msg1: .asciiz "\n¿Cuál es tu edad? "
    msg2: .asciiz "\nNo tienes que cotizar "
    msg3: .asciiz "\nTienes que cotizar"
    msg4: .asciiz "\n¿Cuales son tus ingresos mensuales?"
    valor1: .word 9999

.text
main:

    li $v0,4   # print_str
    la $a0,msg1
    syscall 

    # recibimos el ingreso del usuario en $t1
    li $v0,5
    syscall
    move $t0,$v0
    
    # $s1 = 0 + 16 = 16
    addi $s1, $zero, 16
 
    # si el dato imgresado es mayor  
    slt $t1, $t0, $s1
   
    li $v0,4   # print_str
    la $a0,msg4
    syscall 

    li $v0,5
    syscall
    move $t2,$v0

    # Carga en memoria  el valor
    lw $t3,valor1 

    # si es falso vamos al Else
    bge $t2,$t0,Tipo5
    beq $t1, $0, Else
        li $v0,4
        la $a0,msg2
        syscall
        j Endif
    # si es verdadero imprime Tienes que cotizar
    Else:
        li $v0,4
        la $a0,msg3
        syscall
    Endif:

    li $v0,10
    syscall