1. Implementation instructions:

-> The include statements are already given in the required files in the header section.
-> Steps to run the files in VS Code using terminal:
	-> Extract the zip file to a folder 
	-> Open the folder in VS Code
	-> Open a new terminal
	-> In the terminal, type the following commands:
		
	   1. iverilog -o <name of the test bench file to be tested>.vvp <name of the test bench file to be tested>.v
		
	   This will create a .vvp file in the folder. Next, type the following command in the terminal.

	   2. vvp <name of the test bench file to be tested>.vvp
		
	   This will display the output in the terminal.



2. Assumptions/Brief details about individual questions:

i. Question 1

-> In the one bit adder file, (a, b, c) are the three inputs where a, b are numbers to be
added and c represents the carry_in.
-> In the eight bit adder file, the inter_carry contains the intermediate carry values.
-> In the test bench file, the variable Cin represents the carry_in, and A, B represent
inputs to be added using the adder.


ii. Question 2

-> A and B represent 8-bit inputs to be compared.
-> results are stored in the variables "less","equal" and "greater".


iii. Question 3

-> Three separate files are created to maintain clarity and simplicity.
-> First, the file containing the description of a 2-to-4 decoder was created.
-> This file was then included while creating the file containing the description of
a 3-to-8 decoder.
-> In our model, the 3-to-8 decoder consists of three 2-to-4 decoders with an enable signal.
-> Lastly, a separate test file was created containing all possible test cases.


iv. Question 4

-> The variable 'x' in the A1Q4_pr_en_3to8.v file contains the 8-bit input which is used to calculate the output 'y' using
the priority rules described in the question.


 