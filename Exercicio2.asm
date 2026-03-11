#Lab 1 - Entrada/Saida e Estruturas Condicionais - Exercicio - 2

#Nome: Daniel Henrique Carvalho RA: 10736657
#Nome: Felipe Sousa Vasques Honorato RA: 10735577
#Nome: Giovani de Oliveira Cestari RA: 10738542
#Nome: Laura Yumi Rodrigues Shiguemori RA:10735619

.data
	msg1: .asciiz "Digite o primeiro valor a ser lido: "
	msg2: .asciiz "Digite o segundo valor a ser lido: "
	msg3: .asciiz "Digite o terceiro valor a ser lido: "
	msg4: .asciiz "\nO maior valor eh esse: "
	msg5: .asciiz "\nO valor intermediario eh esse: "
	msg6: .asciiz "\nO menor valor eh esse: "

.text
.globl main
main:

	li $v0,4
	la $a0,msg1
	syscall

	li $v0,5
	syscall	
	move $s0,$v0

	li $v0,4
	la $a0,msg2
	syscall

	li $v0,5
	syscall
	move $s1,$v0

	li $v0,4
	la $a0,msg3
	syscall

	li $v0,5
	syscall
	move $s2,$v0


# Verificar se A é maior
	bgt $s0,$s1,testaA
	j verificaB

testaA:
	bgt $s0,$s2,verificaA_b
	j verificaB


# Verificar se B é maior
	verificaB:
	bgt $s1,$s0,testaB
	j verificaC

testaB:
	bgt $s1,$s2,verificaB_a
	j verificaC


# Verificar se C é maior
verificaC:
	bgt $s2,$s0,testaC
	j fim

testaC:
	bgt $s2,$s1,verificaC_a
	j fim


# A MAIOR

verificaA_b:
	move $s7,$s0
	bgt $s1,$s2,a_b_c
	j a_c_b

a_b_c:

	move $s6, $s1
	move $s5, $s2
	
	j printa


a_c_b:
	move $s6, $s2
	move $s5, $s1
	
	j printa


# B MAIOR

verificaB_a:
	move $s7, $s1
	bgt $s0,$s2,b_a_c
	j b_c_a

b_a_c:
	move $s6, $s0
	move $s5, $s2
	
	j printa
	
b_c_a:
	move $s6, $s2
	move $s5, $s0
	
	j printa
# C MAIOR

verificaC_a:
	move $s7, $s2
	bgt $s0,$s1,c_a_b
	j c_b_a

c_a_b:
	move $s6, $s0
	move $s5, $s1
	
	j printa

c_b_a:
	move $s6, $s1
	move $s5, $s0
	
	j printa
printa:
	li $v0,4
	la $a0,msg4
	syscall

	li $v0,1
	move $a0,$s7
	syscall

	li $v0,4
	la $a0,msg5
	syscall

	li $v0,1
	move $a0,$s6
	syscall

	li $v0,4
	la $a0,msg6
	syscall

	li $v0,1
	move $a0,$s5
	syscall
	
	j fim
fim:
	li $v0,10
	syscall
