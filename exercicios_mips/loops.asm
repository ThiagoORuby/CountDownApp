# for loop
.data
message: .asciiz "##### T A B U A D A ####\n\nDigite um numero: "
plus: .asciiz " x "
equal: .asciiz " = "
newline: .asciiz "\n"

.text
main:
	# initial message
	li $v0, 4
	la $a0, message
	syscall
	
	# get user input
	li $v0, 5
	syscall
	move $s0, $v0
	
	#li $s0, 2
	li $t1, 1 # i (incrementado)
	li $t0, 11 # n
	
	loop:
		jal print_line# set $ra guardar a posição
		
		# increment t1++
		addi $t1, $t1, 1
		
		# check if t0 is less than t1,
		# then go to loop label
		# bne beq ...
		blt $t1, $t0, loop
		
	exit: # exit
	li, $v0, 10
	syscall
	
print_line:
	# print num1
	li $v0, 1
	move $a0, $s0
	syscall
	# print plus
	li $v0, 4
	la $a0, plus
	syscall
	# print num2
	li $v0, 1
	move $a0, $t1
	syscall
	# print equal
	li $v0, 4
	la $a0, equal
	syscall
	# print product
	mul $s1, $s0, $t1
	li $v0, 1
	move $a0, $s1
	syscall
	# new line
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra #return	