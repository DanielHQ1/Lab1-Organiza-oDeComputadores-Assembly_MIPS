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



    msg1: .asciiz "Digite o primeiro operando: \n"
    msg2: .asciiz "Digite o segundo operando: \n"
    resultado: .asciiz "\nResultado da operação: "
    resto: .asciiz "\nresto da divisão: "
    
    retornar_menu: .asciiz "\nDigite qualquer inteiro para voltar ao menu \n"
    
    msg_erro: .asciiz "A opção escolhida não existe, por favor digite qualquer numero inteiro para voltar ao menu \n"

    msg_finalizando: .asciiz "Finalizando o programa."
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
	move $s0, $v0
	
	li $t0, 1
	li $t1, 5
	
	blt $s0, $t0, entrada_invalida
	bgt $s0, $t1, entrada_invalida
	
#Altera o valor do registrador $t0 para 1, para comparar o valor digitado pelo usuário com a opção do menu	
entrada_dados:

	li $t0, 5
	beq $t0, $s0, end

	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 5
	syscall
	move $s2, $v0
	
	li $t0, 1
#Faz a comparação dos valores nos registradores, caso seja verdade executa o trecho de instrução caso1
	beq $t0, $s0, somar
	
	li $t0, 2
	beq $t0, $s0, subtrair
	
	li $t0, 3
	beq $t0, $s0, mutliplicar
	
	li $t0, 4
	beq $t0, $s0, dividir
	


	
	j entrada_invalida
	

somar:
	add $s3, $s1, $s2
	
	j mostrar_resultado
	
subtrair:
	sub $s3, $s1, $s2
	
	j mostrar_resultado

mutliplicar:
	mul $s3, $s1, $s2
	
	j mostrar_resultado
	
dividir:
	div $s3, $s1, $s2
	
	j mostrar_resultado
	
	
	
mostrar_resultado:
	li $v0, 4
	la $a0, resultado
	syscall
	
	li $v0, 1 
	move $a0, $s3
	syscall
	
	li $t5, 4
	beq $s0, $t5, mostrar_resto
	
	li $v0, 4 
	la $a0, retornar_menu
	syscall
	
	li $v0, 5
	syscall
	
	j main
	
entrada_invalida:
	li $v0, 4
	la $a0, msg_erro
	syscall
	
	li $v0, 5
	syscall
	
	j main
	
	
mostrar_resto:
	mul $s4, $s3, $s2
	sub $s5, $s1, $s4
	
	li $v0, 4
	la $a0, resto 
	syscall
	
	li $v0, 1
	move $a0, $s5
	syscall
	
	li $v0, 4 
	la $a0, retornar_menu
	syscall
	
	li $v0, 5
	syscall
	
	j main
	
end: 
	li $v0, 4
	la $a0, msg_finalizando
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	

