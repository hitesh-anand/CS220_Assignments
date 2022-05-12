.data
prompt : .asciiz "The fibonacci numbers upto 500 are: "
sep : .asciiz " "
.text
main :
		move $s0, $zero    #stores the (n-2)th fibonacci number (initially = 0), denoted by prev
		addi $s1, $s0, 1   #stores the (n-1)th fibonacci number (initially = 1), denoted by curr
		
		li $v0, 4
		la $a0, prompt     #print the prompt
		syscall 
		
		
		li $v0, 1
		move $a0, $s0      #print the zeroth fibonacci number
		syscall
		
		li $v0, 4
		la $a0, sep
		syscall		
		
		li $v0, 1
		move $a0, $s1      #print the first fibonacci number
		syscall
		
		li $v0, 4
		la $a0, sep
		syscall
		
loop : 

		add $t1, $s0, $s1     # temp = prev + curr
		move $s0, $s1         # prev = curr
		move $s1, $t1         # curr = temp
		
		slti $t0, $s1, 500    # check for loop termination condition 
		beq $t0, $zero, exit
				

		
		li $v0, 1
		move $a0, $s1
		syscall
		
		li $v0, 4
		la $a0, sep
		syscall
		
		j loop
		


exit:

		li $v0, 10
		syscall
		

# Output : 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377