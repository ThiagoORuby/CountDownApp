.data
message: .asciiz "Digite dois numeros: \n"
soma: .asciiz "\nA soma é: "
subtrac: .asciiz "\nA subtracao é: "
multi: .asciiz "\nA multiplicacao é: "
divis: .asciiz "\nA divisao é: "

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
	
	
	# printing out the text
	li $v0, 4 # load a string
	la $a0, soma # print a string
	syscall # call the operations
	# printing sum
	add $t2, $t0, $t1 # sum t0 and t1 and put on t2
	li $v0, 1 # print a int
	move $a0, $t2 # move t2 to a0
	syscall
	
	# printing out the text
	li $v0, 4 # load a string
	la $a0, subtrac # print a string
	syscall # call the operations
	# printing sub
	sub $t2, $t0, $t1 # sum t0 and t1 and put on t2
	li $v0, 1 # print a int
	move $a0, $t2 # move t2 to a0
	syscall
	
	# printing out the text
	li $v0, 4 # load a string
	la $a0, multi # print a string
	syscall # call the operations
	# printing mult
	mul $t2, $t0, $t1 # sum t0 and t1 and put on t2
	li $v0, 1 # print a int
	move $a0, $t2 # move t2 to a0
	syscall
	
	# printing out the text
	li $v0, 4 # load a string
	la $a0, divis # print a string
	syscall # call the operations
	# printing sub
	div $t2, $t0, $t1 # sum t0 and t1 and put on t2
	li $v0, 1 # print a int
	move $a0, $t2 # move t2 to a0
	syscall
	
	# End program
	li $v0, 10 # end
	syscall
	

