#Lab 1 - Entrada/Saída e Estruturas Condicionais - Exercicio - 3

#Nome: Daniel Henrique Carvalho RA: 10736657
#Nome: Felipe Sousa Vasques Honorato RA: 10735577
#Nome: Giovani de Oliveira Cestari RA: 10738542
#Nome: Laura Yumi Rodrigues Shiguemori RA:10735619


.data
    msg1: .asciiz "Digite o numero para realizar as operações: "
    msg2: .asciiz "O numero é par \n"
    msg3: .asciiz "O numero é impar \n"
    msg4: .asciiz "O 5 bit esta ligado \n"
    msg5: .asciiz "O 5 bit esta desligado \n"

.text
.globl main
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 1
	
	and $t2, $t1, $t0
	
	beq $t2, $zero, par

	
	beq $t2, $t1, impar
	

	instrucao1:
		li $t1, 16
	
		and $t2, $t0, $t1
		
		beq $t2, $zero, bit5_off
	
		beq $t2, $t1, bit5_on 
		j end
	
	j end
	
par:
	li $v0, 4
	la $a0, msg2
	syscall
	j instrucao1
	
impar:
	li $v0, 4
	la $a0, msg3
	syscall
	j instrucao1
		
bit5_on:
	li $v0, 4
	la $a0, msg4
	syscall
	j end
	
bit5_off:
	li $v0, 4
	la $a0, msg5
	syscall
	j end

end:
	li $v0, 10
	syscall