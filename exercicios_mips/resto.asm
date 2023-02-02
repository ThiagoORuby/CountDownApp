.data
init: .asciiz "Digite dois numeros: \n"
message: .asciiz "O mdc é: "

.text
main:
	#init
	li $v0, 4
	la $a0, init
	syscall
	
	# read number a
	li $v0, 5
	syscall
	move $s0, $v0 
	
	# read number b
	li $v0, 5
	syscall
	move $s1, $v0
	
	loop:
		div $t1, $s0, $s1 # a / b -> t1
		mfhi $t2 # resto -> t2
		
		# alterando s0 e s1
		addi $s0, $s1, 0 # -> a = b
		addi $s1, $t2, 0 # -> b = resto = t2
		
		bgt $t2, 0, loop # t2 > 0, continua o loop
	
	# loop mdc
	#div $t0, $t1
	#mfhi $t2
	
	li $v0, 4
	la $a0, message
	syscall
	
	li $v0, 1
	move $a0, $s0 # printo o valor de s0
	syscall
	
	exit:
	li $v0, 10
	syscall