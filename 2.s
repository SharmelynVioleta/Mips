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
    msg1: .asciiz "\nIntroduce la contraseña: "
	str1: .asciiz "contraseña"
	str2: .space 50
    msg2: .asciiz "\nLa contraseña coincide "
    msg3: .asciiz "\nLa contraseña no coincide "
.text
	.globl main
main:
    li $v0,4   # print_str
    la $a0,msg1
    syscall 

	la $a0, str1

    # Ingreso texto de usuario
   	la $a0, str2
    li $a1,50
    li $v0,8
    syscall

	jal compare
	
	move $a0, $v0

    # asigna a v0 el valor 1
	li $v0, 1
	syscall
	
    # exit program
	li $v0, 10
	syscall
 
compare:  # compare str1, str2
	li $v0, 0
LOOP:
	lb $t0, ($a0)
	lb $t1, ($a1)
	add $a0, $a0, 1
	add $a1, $a1, 1
	beqz $t0, LOOP_END
	beqz $t1, LOOP_END
	bgt $t0, $t1, GREATER
	blt $t0, $t1, LESS
	beq $t0, $t1, LOOP
GREATER:
    li $v0, 4   # print_str
    la $a0,msg2
    syscall 
	j END
LESS:
	li $v0, -1
 
	j END
EQUAL:
	li $v0, 0
     li $v0, 4   # print_str
    la $a0,msg3
    syscall 

	j END
LOOP_END:
	beq $t0, $t1, EQUAL
	beqz $t0, LESS
	beqz $t1, GREATER
END:
	jr $ra