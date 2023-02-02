# calculo da area do circulo
.data
message: .asciiz "Digite o valor do raio: \n"
pi: .float 3.141592

.text
main:
	# print message
	li $v0, 4
	la $a0, message
	syscall
	
	# read radius values (float)
	li $v0, 6
	syscall
	mov.s $f12, $f0
	
	l.s $f1, pi
	
	# s0 = r² x pi
	mul.s $f0, $f12, $f12
	mul.s $f12, $f0, $f1
	
	# print a float number
	li $v0, 2
	syscall
	
	# print result
	#li $v0, 1
	#move $a0, $f2
	#syscall
	#li $v0, 2
	#move $a0, $s0
	#syscall
	
	Exit:
	li $v0, 10
	syscall