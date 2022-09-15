.data
    msg1: .asciiz "\n¿Cuál es tu edad? "
    msg2: .asciiz "\nNo tienes que cotizar "
    msg3: .asciiz "\nTienes que cotizar"
    msg4: .asciiz "\n¿Cuales son tus ingresos mensuales?"
    income: .word 9999

.text
main:

    li $v0,4   # print_str
    la $a0,msg1
    syscall 

    # recibimos el ingreso del usuario en $t1
    li $v0,5
    syscall
    move $t0,$v0
    
    # $s1 = 0 + 17 = 17
    addi $s1, $zero, 17
 
    li $v0,4   # print_str
    la $a0,msg4
    syscall 
  

    li $v0,5
    syscall
    move $t2,$v0

    # Carga en memoria  el valor
    lw $t3,income 

    # si es falso vamos al Else
    bge $t0,$s1,if
    j Else 
    # si es verdadero imprime Tienes que cotizar
    If:
        bge $t3,$t2,Else
        li $v0,4
        la $a0,msg3
        syscall
        j Endif
     Else:
        li $v0,4
        la $a0,msg2
        syscall
    Endif:

    li $v0,10
    syscall