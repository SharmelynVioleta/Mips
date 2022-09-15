# key = "contraseña"
# password = input("Introduce la contraseña: ")
# if key == password.lower():
  #   print("La contaseña coincide")
# else:
#     print("La contraseña no coincide")

# recibir out_stringvariable ?c ontraseña 
# input que reciba cadena 
# si son iguales 
# variable creada de la contraseña y luego comparar
.data
    msg1: .asciiz "\nIntroduce la contraseña:"
	str1: .asciiz "contraseña\n"
	str2: .space 50
    msg2: .asciiz "\nLa contraseña coincide "
    msg3: .asciiz "\nLa contraseña no coincide "
.text
	.globl main
main:

    li $v0,4   # print_str
    la $a0,msg1
    syscall 

    # Ingreso texto de usuario
   	la $a0, str2
    li $a1,49
    li $v0,8
    syscall

	la    $s1, str1
    la    $s2, str2

LOOP:
	lb $t0, ($s1)
	lb $t1, ($s2)
	bne $t0, $t1, NOTEQUAL
	beq $t0, $zero, EQUAL
    addi $s1, $s1, 1
	addi $s2, $s2, 1
    j LOOP
    
NOTEQUAL:
    li $v0, 4   # print_str
    la $a0,msg3
    syscall 
	j END
EQUAL:
    li $v0, 4   # print_str
    la $a0,msg2
    syscall 
	j END

END:
    li $v0,10
    syscall
	jr $ra