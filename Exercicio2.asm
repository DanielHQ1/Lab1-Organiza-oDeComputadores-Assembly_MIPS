#Lab 1 - Entrada/Saída e Estruturas Condicionais - Exercicio - 2

#Nome: Daniel Henrique Carvalho RA: 10736657
#Nome: Felipe Sousa Vasques Honorato RA: 10735577
#Nome: Giovani de Oliveira Cestari RA: 10738542
#Nome: Laura Yumi Rodrigues Shiguemori RA:10735619


.data
    msg1: .asciiz "Digite o primeiro valor a ser lido:"
    msg2: .asciiz "Digite o segundo valor a ser lido:"
    msg3: .asciiz "Digite o terceiro valor a ser lido:"
    msg4: .asciiz "O maior valor é esse: "
    msg5: .asciiz "O "
    msg6: .asciiz " é maior que "  
    msg7: .asciiz " porem, igual a "
    msg8: .asciiz "Todos os valores são iguais."
    
    
    
.text
.globl main
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	bgt $s0, $s1, s0_great_s1
	
	bgt $s1, $s0, s1_great_s0
	
	bgt $s2, $s0, s2_great_s0
	
	bgt $s2, $s1, s2_great_s1
	
	beq $s0, $s1, s0_equals_s1
	
	j end
	
all_equals:
	li $v0, 4
	la $a0, msg8
	syscall
	
	j end
	
s0_equals_s1:

	bgt $s0, $s2, s0_great_all
	
	beq $s0, $s2, all_equals
	
	j end
s0_great_s1:
	bgt $s0, $s2, s0_great_all
	
	ble $s0, $s2, s2_great_all
	

	j end
	
	
s2_great_s1:
	bgt $s2, $s0, s2_great_all
	
	ble $s2, $s0, s0_great_all

	

s1_great_s0:
	bgt $s1, $s2, s1_great_all
	
	ble $s1, $s2, s2_great_all
	
	
s2_great_s0:
	bgt $s2, $s1, s2_great_all
	
	ble $s2, $s1, s1_great_all
	
	
s1_great_all:
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	j end
	
	
	
s0_great_all:
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	j end
	
s2_great_all:
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	

	j end
	
		
end:
	li $v0, 10
