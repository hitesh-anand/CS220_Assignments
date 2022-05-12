.data
        promptlen: .asciiz "Enter n: "
        promptin: .asciiz "Enter X line by line: "
        result: .asciiz "The value is: "
        array: .space 40

.text
.globl main

        main: 
                # message requesting n as input
                li $v0, 4 
                la $a0, promptlen
                syscall

                # read n and store it in $t0
                li $v0, 5
                syscall
                addi $t0, $v0, 0
				
				beq $t0, $zero, finish
                
                # load address of array in $t1
                la $t1, array 

                # setup counter in $s0
                li $s0, 0

                # message requesting n values as input for the vector
                li $v0, 4 
                la $a0, promptin
                syscall
        
        input:         
                # read elements of array and store it
                li $v0, 6
                syscall 
                swc1 $f0, 0($t1)

                # move pointer to array ahead
                addi $t1, $t1, 4

                # increment counter and check for loop ending
                addi $s0, $s0, 1
                bne $s0, $t0, input

                # reset counter in $s0 if loop is done
                li $s0, 0
                
                # reset pointer to array
                la $t1, array

                # make accumulator f0 for total sum and setup 0 in $f2
                li.s $f0, 0.0
                li.s $f2, 0.0

                # setup multiplier in $f1 (1 for first iteration)
                li.s $f1, 1.0
                

        altproduct: 
           
                lwc1 $f3, 0($t1) # load from array
                
                # update the accumulator
                mul.s $f3, $f3, $f1
                add.s $f0, $f0, $f3

                # multiplier for next iteration
                sub.s $f1, $f2, $f1

                # increment pointers
                addi $t1, $t1, 4

                # increment counter and check for loop ending
                addi $s0, $s0, 1
                bne $s0, $t0, altproduct

                # printing final output
                li $v0, 4
                la $a0, result
                syscall

                mov.s $f12, $f0

                li $v0, 2
                syscall
				
		finish:
		
				li $v0, 10
				syscall

                jr $ra
				
				
#Test case 1 : n = 5
		
		# X = {1.32, -1.23, 2.54, -2.43, 1.456}
		# output = 8.97600079
		
		
#Test case 2 : n = 0

		# No output in this case.
		
				
				
				