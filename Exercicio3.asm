#Lab 1 - Entrada/Saída e Estruturas Condicionais - Exercicio - 3

#Nome: Daniel Henrique Carvalho RA: 10736657
#Nome: Felipe Sousa Vasques Honorato RA: 10735577
#Nome: Giovani de Oliveira Cestari RA: 10738542
#Nome: Laura Yumi Rodrigues Shiguemori RA:10735619


.data
    msg1: .asciiz "Digite o numero para realizar as operacoes: "
    msg2: .asciiz "O numero eh par \n"
    msg3: .asciiz "O numero eh impar \n"
    msg4: .asciiz "O 5 bit esta ligado \n"
    msg5: .asciiz "O 5 bit esta desligado \n"

.text
.globl main
main:
#printa a string msg1 na tela
	li $v0, 4
	la $a0, msg1
	syscall

#pede o input do valor que sera comparado para fazer as verificacoes de 5 bit e impar ou par	
	li $v0, 5
	syscall
#transfere o valor de entrada do registrador $v0 para o registrador $s0
	move $s0, $v0
	
	j verifica_5bit
	
instrucao1:
	j impar_ou_par
	
verifica_5bit:
	li $t0, 16
	
#faz a operação and do valor de entrada com o valor com 16 para fazer a verificação sobre o quinto bit
	and $s1, $t0, $s0
	
#caso o valor tiver o 5 bit ligado o valor sera sera maior que 0
	bgt $s1, $zero, print_bit5On
#caso o valor tiver o 5 bit desligado o valor sera 0 pois o and foi feito do valor de entrada com 16, permitindo apenas o valor 16 no regitrador $s1	
	beq $s1, $zero, print_bit5Off
	
	j end
	
	
impar_ou_par:
#colocando o valor de $t0 para 1, depois faz um and do valor de entrada com o 1, caso o resultado do and seja 1, significa que o primeiro bit esta ligado o que significa que o numero eh impar
	li $t0, 1
#o and de 1 com o valor de entrada e salva o resultado em $s2	
	and $s2, $t0, $s0
#compara o valor em $s2 com zero, caso seja maior que 0 o valor eh impar	
	bgt $s2, $zero, print_impar
#compara o valor em $s2 com zero, caso seja igual o valor eh par	
	beq $s2, $zero, print_par
	
	j end

print_par:
	 li $v0, 4
	 la $a0, msg2
	 syscall
	 
	j end
print_impar: 
	li $v0, 4
	la $a0, msg3
	syscall
	
	j end
print_bit5On:
	li $v0, 4
	la $a0, msg4
	syscall
#volta a label intrucao 1 escrita no main para continuar a comparacao de impar ou par	
	j instrucao1
	
print_bit5Off:
	li $v0, 4
	la $a0, msg5
	syscall
#volta a label intrucao 1 escrita no main para continuar a comparacao de impar ou par
	j instrucao1
end:
#finalizacao do programa
	li $v0, 10
	syscall
