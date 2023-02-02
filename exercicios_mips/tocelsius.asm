.data
message: .asciiz "Digite um numero: \n"
fat1: .float 32.0
fat2: .float 1.8

.text
main:
	# Initial mensage
	li $v0, 4
	la $a0, message
	syscall
	
	# read float
	li $v0, 6
	syscall
	mov.s $f12, $f0
	
	# load fat1, fat2
	l.s $f1, fat1
	l.s $f2, fat2
	
	# calc
	sub.s $f12, $f12, $f1
	div.s $f12, $f12, $f2
	
	# print result
	li $v0, 2
	syscall
	
	exit:
	li $v0, 10
	syscall
	
	