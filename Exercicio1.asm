#Lab 1 - Entrada/Saida e Estruturas Condicionais - Exercicio 1

#Nome: Daniel Henrique Carvalho RA: 10736657
#Nome: Felipe Sousa Vasques Honorato RA: 10735577
#Nome: Giovani de Oliveira Cestari RA: 10738542
#Nome: Laura Yumi Rodrigues Shiguemori RA:10735619

.data
    menu0: .asciiz "-----Menu----- \n"
    menu1: .asciiz "1. Soma \n"
    menu2: .asciiz "2. Subtracao \n"
    menu3: .asciiz "3. Multiplicacao \n"
    menu4: .asciiz "4. Divisao \n"
    menu5: .asciiz "5. Sair \n"
    
    msg1: .asciiz "Digite o primeiro operando: \n"
    msg2: .asciiz "Digite o segundo operando: \n"
    resultado: .asciiz "\nResultado da operacao: "
    resto: .asciiz "\nresto da divisao: "
    
    
    msg_erro: .asciiz "A opcaoo escolhida nao existe, por favor digite qualquer numero inteiro para voltar ao menu \n"

    msg_finalizando: .asciiz "Finalizando o programa."
    
    msg_divisao_nao_aceita: .asciiz "Nao eh possivel realizar divisao por 0 \n"
.text
.globl main
main:

#Faz a impressao das opcoes do menu na tela, cada numeracao eh uma parte do menu
#carrega o metodo 4(impressao de string) no registrador v0, que espera o conteudo da string seja carregado em $a0,
#depois passa o endereço da string para $a0, depois faz a execucao disso com o syscall.
	li $v0, 4
	la $a0, menu0
	syscall
	
#Executa a mesma funcao da instrucao anterior porem com a diferenca de qual string sera utilizada
	li $v0, 4
	la $a0, menu1
	syscall

#Executa a mesma funcao da instrucao anterior porem com a diferenca de qual string sera utilizada
	li $v0, 4
	la $a0, menu2
	syscall

#Executa a mesma funcao da instrucao anterior porem com a diferenca de qual string sera utilizada	
	li $v0, 4
	la $a0, menu3
	syscall
	
#Executa a mesma funcao da instrucao anterior porem com a diferenca de qual string sera utilizada
	li $v0, 4
	la $a0, menu4
	syscall
	
#Executa a mesma funcao da instrucao anterior porem com a diferenca de qual string sera utilizada
	li $v0, 4
	la $a0, menu5
	syscall
	
#coloca no registrador $v0 o valor de 5, que é entendido como entrada de valor inteiro, esse valor inteiro eh armazenado temporariamente em $v0
	li $v0, 5
	syscall	
#move valor de $v0 para $s0, pois $v0 é utilizado para a chamadas das funcoes e precisa salvar o valor em algum registrador para ficar salvo
	move $s0, $v0
	
#Altera o valor do registrador $t0 para 1, para comparar o valor digitado pelo usuario com a opcaoo do menu	
	li $t0, 1  	#variavel temporaria atribuindo t0 = 1
	li $t1, 5	#variavel temporaria atribuindo t1 = 5
	
	blt $s0, $t0, entrada_invalida  	#s0 < 1 =  entrada invalida, pois nao existe opcao de menu com valor menor que 1
	bgt $s0, $t1, entrada_invalida  	#s0 > 5 =  entrada invalida, pois nao existe opcao de menu com valor maior que 5
	

entrada_dados:

	li $t0, 5		#variavel temporaria atribuindo t0 = 5
	beq $t0, $s0, end	#comparando t0 ao digito do usuario pois s0 = 5 acaba o programa

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

#verificacao se o usuario digitou o segundo operando = 0
	li $t1, 4 
	beq $s0, $t1, teste_divisao
	
teste_divisao:
	beq $s2, $zero, divisao_por_0	#trata o caso de o usuario tentar fazer a divsao por 0	
	
#verificacao se o usuario digitou o numero 1
	li $t0, 1
	beq $t0, $s0, somar
#verificacao se o usuario digitou o numero 2	
	li $t0, 2
	beq $t0, $s0, subtrair
#verificacao se o usuario digitou o numero 3	
	li $t0, 3
	beq $t0, $s0, mutliplicar
#verificacao se o usuario digitou o numero 4	
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
#printa a string com a mensagem para mostrar o resultado
	li $v0, 4
	la $a0, resultado
	syscall
#printa o resultado
	li $v0, 1 
	move $a0, $s3
	syscall
#laco para caso de a operacao caso seja uma divisao e mostrar o resto
	li $t5, 4
	beq $s0, $t5, mostrar_resto
	
	li $v0, 4 
	la $a0, retornar_menu
	syscall
	
	j main
	
entrada_invalida:
#mostra mesagem de erro e volta ao menu
	li $v0, 4
	la $a0, msg_erro
	syscall
	
	j main
	
	
mostrar_resto:
#calculo para mostrar o resto da divisao

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
	
	j main
	
divisao_por_0:
#mensagem que aparece caso o usuario tentar fazer a divisao por 0, depois ele retonar ao menu
	li $v0, 4
	la $a0, msg_divisao_nao_aceita
	syscall
	
	li $v0, 4 
	la $a0, retornar_menu
	syscall
	
	j main
	
end: 
#envia a mensagem de finalizacao do programa
	li $v0, 4
	la $a0, msg_finalizando
	syscall
#termina o programa colocando o valor de $v0 em 10, e fazendo a chamada dessa funcao 	
	li $v0, 10
	syscall
	
	
	
	
	

