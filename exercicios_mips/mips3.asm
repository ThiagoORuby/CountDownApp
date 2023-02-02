# Arrays in MIPS

.data
myarray: .word 1, 2, 5, 9, 1
array2: .space 12


.text
main:
	# Load a values in an array
	la $s0, myarray
	lw $t1, 0($s0) # pos + 4 -> 0, 4, 8, 12, 16, ... 

	li $v0, 1 # print a int
	move $a0, $t1 # move t2 to a0
	syscall

	# edit a value in an array
	addi $s2, $zero, 4 # valor q quero adicionar
	addi $t2, $zero, 0 # valor da posicao do array
	sw $s2, array2($t2) # salvando na posição t2 o valor s2
	
	la $s1, array2 # pegando primeira posição do array
	lw $t1, 0($s1) # lendo valor na posição 0 do array
	
	# printando
	li $v0, 1 # print a int 
	move $a0, $t1 # move t2 to a0
	syscall
	
	
	# End program
	Exit:
		li $v0, 10 # end
		syscall
	
	
	
