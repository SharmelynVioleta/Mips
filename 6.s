.data
    msg1: .asciiz "\n¿Como te llamas? "
    msg2: .asciiz "\n¿Cuál es tu sexo? (M o H)? "
    msg4: .asciiz "\nTu grupo es B "
    msg5: .asciiz "\nTu grupo es A "
    nombre: .space 20
    charm: .byte 'm'
    charn: .byte 'n'
    key2: .byte ' '
.text
main:

    li $v0,4   # print_str
    la $a0,msg1
    syscall 

    # recibimos el nombre del usuario en $a0
    li $v0,8
    la $a0, nombre
    syscall

    addu $a0,$a0, 0
    lbu $a0, ($a0) # Guardamos en $a0 el valor del primer caracter del nombre del usuario
    add $s1, $0, $a0  # Guardamos el valor acssi del primer caracter del nombre del usuario

    li $v0,4   # print_str
    la $a0,msg2
    syscall 

    # recibimos el sexo del usuario
    li $v0,12
    syscall

    sb $v0, key2  # Guardamos el caracter en Key2
    lb $a0, key2  # Pasamos a a0 el valor del caracter key2
    add $s3, $0, $a0 # Guardamos el valor acssi de la key2 (sexo del usuario) en $s3

    lb $a0, charm # Pasamos a a0 el valor del caracter m
    add $s2, $0, $a0 # Guardamos el valor acssi de la letra m en $s2

    lb $a0, charn # Pasamos a a0 el valor del caracter n
    add $s4, $0, $a0 # Guardamos el valor acssi de la letra n en $s4

    # Si se cumple que El genero es "m" vamos al if
    beq $s3, $s2, if

    bge $s1, $s4, GRUPOA
    j GRUPOB

    GRUPOB:
    # print string
        li $v0,4
        la $a0,msg4
        syscall
        j Endif
    if:
        # compara
        bge $s2, $s1, GRUPOA
        j GRUPOB
    GRUPOA:
        # print string
        li $v0,4
        la $a0,msg5 
        syscall
        j Endif
    Endif:

    li $v0,10
    syscall