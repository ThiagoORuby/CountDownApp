# fatorial de um numero
.data
message: .asciiz "Digite o numero: "
result: .asciiz "\nO fatorial é: "

.text
main:

	# Initial message
	li $v0, 4
	la $a0, message
	syscall
	# read an integer
	li $v0, 5
	syscall
	move $s0, $v0
	
	# calc faltorial loop
	li $t0, 1 # iterador
	li $t1, 1 #iterador
	
	loop:
		# t1 = t1 * i
		mul $t1, $t1, $t0
		
		# i++
		addi $t0, $t0, 1
		
		ble $t0, $s0, loop
		
	
	# Result
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	Exit:
	li $v0, 10
	syscall