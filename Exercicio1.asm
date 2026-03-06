#Lab 1 - Entrada/Saída e Estruturas Condicionais - Exercicio 1

#Nome: Daniel Henrique Carvalho RA: 10736657
#Nome: Felipe Sousa Vasques Honorato RA: 10735577
#Nome: Giovani de Oliveira Cestari RA: 10738542
#Nome: Laura Yumi Rodrigues Shiguemori RA:10735619

.data

    menu0: .asciiz "-----Menu----- \n"
    menu1: .asciiz "1. Soma \n"
    menu2: .asciiz "2. Subtração \n"
    menu3: .asciiz "3. Multiplicação \n"
    menu4: .asciiz "4. Divisão \n"
    menu5: .asciiz "5. Sair \n"



    msg1: .asciiz "Digite o primeiro número: \n"
    msg2: .asciiz "Digite o segundo número: \n"
    resultado: .asciiz "\nResultado da operação: \n"
    resto: .asciiz "resto da divisão: \n"

.text
.globl main
main:

#Faz a impressão das opções do menu na tela
	li $v0, 4
	la $a0, menu0
	syscall
	
	li $v0, 4
	la $a0, menu1
	syscall

	li $v0, 4
	la $a0, menu2
	syscall
	
	li $v0, 4
	la $a0, menu3
	syscall
	
	li $v0, 4
	la $a0, menu4
	syscall
	
	li $v0, 4
	la $a0, menu5
	syscall
	
#Faz a leitura do console para verificar qual opção deverá ser chamada
	li $v0, 5
	syscall	
	move $t1, $v0
	
#Altera o valor do registrador $t0 para 1, para comparar o valor digitado pelo usuário com a opção do menu	
	li $t0, 1
#Faz a comparação dos valores nos registradores, caso seja verdade executa o trecho de instrução caso1
	beq $t0, $t1, caso1
	
	li $t0, 2
	beq $t0, $t1, caso2
	
	li $t0, 3
	beq $t0, $t1, caso3
	
	li $t0, 4
	beq $t0, $t1, caso4
	
	li $t0, 5
	beq $t0, $t1, end
	
	
	
	j end
	
caso1:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	add $t2, $t0, $t1
	
	li $v0, 4
	la $a0, resultado
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	
caso2:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	sub $t2, $t0, $t1
	
	li $v0, 4
	la $a0, resultado
	syscall
	
	la $v0, 1
	move $a0, $t2
	syscall
	
caso3:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	mul $t2, $t0, $t1
	
	li $v0, 4
	la $a0, resultado
	syscall
	
	la $v0, 1
	move $a0, $t2
	syscall
	
caso4:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	div $t2, $t0, $t1
#Operação para pegar o resto da divisão
	mul $t4, $t1, $t2
	sub $t5, $t0, $t4
	
	li $v0, 4
	la $a0, resto
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0, resultado
	syscall
	
	la $v0, 1
	move $a0, $t2
	syscall
	
	
end: 
	li $v0, 10
	syscall
	
	
	
	
	

