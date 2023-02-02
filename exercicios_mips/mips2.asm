.data
message: .asciiz "Escreva dois numeros: \n"
true: .asciiz "Os valores são iguais\n"
false: .asciiz "Os valores são diferentes\n"

.text
main:
	# printing out the text
	li $v0, 4 # load a string
	la $a0, message # print a string
	syscall # call the operations
	
	# Getting user input
	li $v0, 5 # input 1
	syscall
	move $t0, $v0 # move v0 to t0
	
	li $v0, 5 # input 2
	syscall
	move $t1, $v0 # move v0 to t1
	
	# if t1 == t2: go to L2
	beq $t0, $t1, L2
	
	# else
	li $v0, 4 # load a string
	la $a0, false # print a string
	syscall # call the operations
	j Exit
	
	# if true
	L2:
		# printing out the text
		li $v0, 4 # load a string
		la $a0, true # print a string
		syscall # call the operations
	
	# End program
	Exit:
		li $v0, 10 # end
		syscall
