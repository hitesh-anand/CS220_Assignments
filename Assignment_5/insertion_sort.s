.data
        message1: .asciiz "Enter 10 integers line by line: "
        message2: .asciiz "The sorted array is:  "   
        arr: .space 40

.text
.globl main

        main: 
				addi $t0,$t0, 10
                
                # load address of arr in $t1
                la $t1, arr

                # setup counter in $s0
                li $s0, 0

                # message requesting arr as input
                li $v0, 4 
                la $a0, message1
                syscall
        
        arr_in:         
                li $v0, 5
                syscall 
                sw $v0, 0($t1)

                # move pointer to arr ahead
                addi $t1, $t1, 4

                # increment counter and check for loop ending
                addi $s0, $s0, 1
                bne $s0, $t0, arr_in 

                # reset counter in $s0 if loop is done
                li $s0, 0
                
                # reset pointer to arr
                la $t1, arr 
				
				addi $t2, $zero, 1     # i = 1
				
				
		loopout:
		
				sll $t3, $t2, 2
				add $t3, $t3, $t1
				lw $t4, 0($t3)   # key = arr[i]
				
				addi $t5, $t2, -1    # j = i-1
				
				sll $s1, $t5, 2
				add $s1, $t1, $s1
				lw $t7, 0($s1)        # t7 contains arr[j]
		
				slti $t3, $t5, 0            # checks if j < 0
				bne $t3, $zero, exitin
				slt $t3, $t4, $t7           # checks if arr[j] > key
				beq $t3, $zero, exitin
				
		loopin :
		

		
				sw $t7, 4($s1)             # arr[j+1] = key
				addi $t5, $t5, -1          # j = j-1
				
				sll $s1, $t5, 2
				add $s1, $t1, $s1
				lw $t7, 0($s1)        # t7 contains arr[j]
				
				slti $t3, $t5, 0
				bne $t3, $zero, exitin
				slt $t3, $t4, $t7
				bne $t3, $zero, loopin
				

				
				
		exitin:
				sw $t4, 4($s1)
				
				
				# increment counter and check for loop ending
                addi $t2, $t2, 1
                bne $t2, $t0, loopout

			
		
				addi $t2, $zero, 0
				
				li $v0, 4 
                la $a0, message2
                syscall
				
		printLoop :
		
				sll $t3, $t2, 2
				add $t3, $t3, $t1
			
				li $a0, 32
				li $v0, 11  # syscall number for printing character
				syscall
				
				li $v0, 1
				lw $a0, 0($t3)
				syscall
				
				addi $t2, $t2, 1
                bne $t2, $t0, printLoop
				

				li $v0, 10
				syscall
				
				jr $ra
				
				
# Test case 1 :
#   input : 12, 4, -2, 3, 45, 56, 13, 51, 142, -47
# 	output : -47, -2, 3, 4, 12, 13, 45, 51, 56, 142
				
				
				
				
				
				
		
				


