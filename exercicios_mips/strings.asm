#Working wiht strings
# comparando 2 strings

.data
string1: .space 20
string2: .space 20
ex1: .asciiz "As strings sao diferentes\n"
ex2: .asciiz "As strings sao iguais\n"

.text
main:
	# string 1
	li $v0, 8 # v0 recebe 8 -> read_string
	la $a0, string1 # carrega o endereço da primeira posição do buffer em a0
	li $a1, 20 # carrega o tamanho do buffer em a1
	move $s0, $a0 # endereço da 1pos da string pra t0
	syscall # chamar a rotina
	
	# string 2
	li $v0, 8 # v0 recebe 8 -> read_string
	la $a0, string2 # carrega o endereço da primeira posição do buffer em a0
	li $a1, 20 # carrega o tamanho do buffer em a1
	move $s1, $a0 # endereço da 1pos da string pra t0
	syscall # chamar a rotina
	
	add $t0, $zero, $zero # i = 0
	addi $t3, $zero, 10 # MAXN = 10
	
	loop: # loop
	add $t1, $s0, $t0 # t3 = string1 + i
	lb $t2, 0($t1) # t2 = t3

	add $t4, $s1, $t0 # t4 = string2 + i
	lb $t5, 0($t4) # t5 = t4
	
	bne $t2, $t5, exit1 # if t2 != t5 goto exit
	beq $t0, $t3, exit2 # if i == MAXN goto exit
	addi $t0, $t0, 1 # i++
	j loop
	
	exit1: # strings diferentes
	li $v0, 4
	la $a0, ex1
	syscall
	j end
	
	exit2: # strings iguais
	li $v0, 4
	la $a0, ex2
	syscall
	
	end:
	li $v0, 10
	syscall