 .data
msg1:.asciiz "\nIntroduce un número entero:"
msg2: .asciiz "\nEl número es par"
msg3:.asciiz "\nEl número es impar"

.text

main: 

# $t0 = 0 + 2 = 2
addi $t0, $zero, 2

# print_str
la $a0, msg1
li $v0, 4
syscall

# ingreso usuario
li $v0, 5
syscall

# disivion ingreso usuario entre $t0 = 2
div $v0, $t0

# almacena cociente 
mfhi $t1

# compara si el cociente es diferente de 0
beq $t1, $0, ELSE

    la $a0, msg3
    li $v0, 4
    syscall
    j Endif
# saltó a else porque el cociente es igual a 0
ELSE: 
    la $a0, msg2
    li $v0, 4
    syscall
    j Endif
Endif: 

# exit
li $v0, 10
syscall
