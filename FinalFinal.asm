
.data
#Codes for drawing the Board
	GameState:.word 0	#when zero there is no win
	Player1Win: .asciiz "Player 1 wins!"
	Player2Win: .asciiz "Player 2 wins!"
	PlayerTie: .asciiz "There is a tie!"
	Wall:	  .word 0x7c
	Floor:	  .word 0x5f
	newline:  .asciiz "\n"
	#Column 0		#The following blocks contain the contents of each space in the board as an ascii value
	ZeroFive: .word 0x5f
	ZeroFour: .word 0x5f
	ZeroThree:.word 0x5f
	ZeroTwo:  .word 0x5f
	ZeroOne:  .word 0x5f
	ZeroZero: .word 0x5f
	#Column 1
	OneFive: .word 0x5f
	OneFour: .word 0x5f
	OneThree:.word 0x5f
	OneTwo:  .word 0x5f
	OneOne:  .word 0x5f
	OneZero: .word 0x5f
	#Column 2
	TwoFive: .word 0x5f
	TwoFour: .word 0x5f
	TwoThree:.word 0x5f
	TwoTwo:  .word 0x5f
	TwoOne:  .word 0x5f
	TwoZero: .word 0x5f
	#Column 3
	ThreeFive: .word 0x5f
	ThreeFour: .word 0x5f
	ThreeThree:.word 0x5f
	ThreeTwo:  .word 0x5f
	ThreeOne:  .word 0x5f
	ThreeZero: .word 0x5f
	#Column 4
	FourFive: .word 0x5f
	FourFour: .word 0x5f
	FourThree:.word 0x5f
	FourTwo:  .word 0x5f
	FourOne:  .word 0x5f
	FourZero: .word 0x5f
	#Column 5
	FiveFive: .word 0x5f
	FiveFour: .word 0x5f
	FiveThree:.word 0x5f
	FiveTwo:  .word 0x5f
	FiveOne:  .word 0x5f
	FiveZero: .word 0x5f
	#Column 6
	SixFive: .word 0x5f
	SixFour: .word 0x5f
	SixThree:.word 0x5f
	SixTwo:  .word 0x5f
	SixOne:  .word 0x5f
	SixZero: .word 0x5f
#Column Incrementers
	colZero: .word 0
	colOne:  .word 0
	colTwo:  .word 0
	colThree:.word 0
	colFour: .word 0
	colFive: .word 0
	colSix:  .word 0
#Prompts
greeting: .asciiz "\nHello! Welcome to Connect Four: Team Mips Reference Sheet edition."
AI_or_PvP: .asciiz "\nPlease enter 1 for AI opponent or 2 for two players: "
entryOne: .asciiz "\nPlayer One, enter the column (0-6) to place your piece: "
entryTwo: .asciiz "\nPlayer Two, enter the column (0-6) to place your piece: "
invalid:  .asciiz "\nNot a valid entry :^("
.globl	main
.text
		
.macro JingleOne
li $a0, 50 #pitch
li $a1, 800 #duration
li $a2, 0 #instrument
li $a3, 127 #volume
#default values

#note to make it start (doesn't play the first note for some reason)
li $a1, 10 #duration
li $a0, 48 #pitch
li $v0, 31 #play note
syscall
li $a0, 10 #delay
li $v0, 32 #sleep
syscall
#note 1
li $a1, 500 #duration
li $a0, 48 #pitch
li $v0, 31 #play note
syscall
li $a0, 430 #delay
li $v0, 32 #sleep
syscall
#note 2
li $a1, 500 #duration
li $a0, 52 #pitch
li $v0, 31 #play note
syscall
.end_macro	

.macro JingleTwo
li $a0, 50 #pitch
li $a1, 800 #duration
li $a2, 0 #instrument
li $a3, 127 #volume
#default values

#note to make it start (doesn't play the first note for some reason)
li $a1, 10 #duration
li $a0, 48 #pitch
li $v0, 31 #play note
syscall
li $a0, 10 #delay
li $v0, 32 #sleep
syscall
#note 1
li $a1, 500 #duration
li $a0, 52 #pitch
li $v0, 31 #play note
syscall
li $a0, 430 #delay
li $v0, 32 #sleep
syscall
#note 2
li $a1, 500 #duration
li $a0, 48 #pitch
li $v0, 31 #play note
syscall
.end_macro	
																
.macro PlayMusic
li $a0, 50 #pitch
li $a1, 800 #duration
li $a2, 0 #instrument
li $a3, 127 #volume
#default values

#note to make it start (doesn't play the first note for some reason)
li $a1, 10 #duration
li $a0, 48 #pitch
li $v0, 31 #play note
syscall
li $a0, 10 #delay
li $v0, 32 #sleep
syscall
#note 1
li $a1, 800 #duration
li $a0, 48 #pitch
li $v0, 31 #play note
syscall
li $a0, 730 #delay
li $v0, 32 #sleep
syscall
#note 2
li $a1, 800 #duration
li $a0, 51 #pitch
li $v0, 31 #play note
syscall
li $a0, 730 #delay
li $v0, 32 #sleep
syscall
#note 3
li $a1, 600 #duration
li $a0, 53 #pitch
li $v0, 31 #play note
syscall
li $a0, 530 #delay
li $v0, 32 #sleep
syscall
#note 4
li $a1, 600 #duration
li $a0, 51 #pitch
li $v0, 31 #play note
syscall
li $a0, 530 #delay
li $v0, 32 #sleep
syscall
#note 5
li $a1, 400 #duration
li $a0, 53 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 6
li $a1, 400 #duration
li $a0, 53 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 7
li $a1, 400 #duration
li $a0, 53 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 8
li $a1, 400 #duration
li $a0, 58 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 9
li $a1, 400 #duration
li $a0, 56 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 10
li $a1, 200 #duration
li $a0, 55 #pitch
li $v0, 31 #play note
syscall
li $a0, 130 #delay
li $v0, 32 #sleep
syscall
#note 11
li $a1, 400 #duration
li $a0, 53 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 12
li $a1, 800 #duration
li $a0, 55 #pitch
li $v0, 31 #play note
syscall
li $a0, 830 #delay
li $v0, 32 #sleep
syscall
#note 13
#100ms delay between these two notes
li $a1, 800 #duration
li $a0, 55 #pitch
li $v0, 31 #play note
syscall
li $a0, 730 #delay
li $v0, 32 #sleep
syscall
#note 14
li $a1, 800 #duration
li $a0, 58 #pitch
li $v0, 31 #play note
syscall
li $a0, 730 #delay
li $v0, 32 #sleep
syscall
#note 15
li $a1, 600 #duration
li $a0, 60 #pitch
li $v0, 31 #play note
syscall
li $a0, 530 #delay
li $v0, 32 #sleep
syscall
#note 16
li $a1, 600 #duration
li $a0, 53 #pitch
li $v0, 31 #play note
syscall
li $a0, 530 #delay
li $v0, 32 #sleep
syscall
#note 17
li $a1, 400 #duration
li $a0, 51 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 18
li $a1, 400 #duration
li $a0, 58 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 19
li $a1, 400 #duration
li $a0, 58 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 20
li $a1, 400 #duration
li $a0, 55 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 21
li $a1, 400 #duration
li $a0, 58 #pitch
li $v0, 31 #play note
syscall
li $a0, 330 #delay
li $v0, 32 #sleep
syscall
#note 22
li $a1, 600 #duration
li $a0, 58 #pitch
li $v0, 31 #play note
syscall
li $a0, 530 #delay
li $v0, 32 #sleep
syscall
#note 23
li $a1, 1000 #duration
li $a0, 60 #pitch
li $v0, 31 #play note
syscall
li $a0, 930 #delay
li $v0, 32 #sleep
syscall
.end_macro

.macro DrawBoard	#Create the slot for (0,5) in our board
	li $v0, 11
	lw $a0, newline
	syscall
	lw $a0, Wall
	syscall
	lw $a0, Floor
	syscall
	lw $a0, ZeroFive
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			#Create the slot for (1,5) in our board
	lw $a0, Floor
	syscall
	lw $a0, OneFive
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
	 		#Create the slot for (2,5) in our board
	lw $a0, Floor
	syscall
	lw $a0, TwoFive
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			 #Create the slot for (3,5) in our board
	lw $a0, Floor
	syscall
	lw $a0, ThreeFive
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			 #Create the slot for (4,5) in our board
	lw $a0, Floor
	syscall
	lw $a0, FourFive
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			 #Create the slot for (5,5) in our board
	lw $a0, Floor
	syscall
	lw $a0, FiveFive
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			 #Create the slot for (6,5) in our board
	lw $a0, Floor
	syscall
	lw $a0, SixFive
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
	lw $a0, newline
	syscall
									#Row 4
		 	 #Create the slot for (0,4) in our board
	lw $a0, Wall
	syscall
	lw $a0, Floor
	syscall
	lw $a0, ZeroFour
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			#Create the slot for (1,4) in our board
	lw $a0, Floor
	syscall
	lw $a0, OneFour
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			#Create the slot for (2,4) in our board
	lw $a0, Floor
	syscall
	lw $a0, TwoFour
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			 #Create the slot for (3,4) in our board
	lw $a0, Floor
	syscall
	lw $a0, ThreeFour
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
		 	 #Create the slot for (4,4) in our board
	lw $a0, Floor
	syscall
	lw $a0, FourFour
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			 #Create the slot for (5,4) in our board
	lw $a0, Floor
	syscall
	lw $a0, FiveFour
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
				 #Create the slot for (6,4) in our board
	lw $a0, Floor
	syscall
	lw $a0, SixFour
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
	lw $a0, newline
	syscall
									#Row 3
		 	 #Create the slot for (0,3) in our board
	lw $a0, Wall
	syscall
	lw $a0, Floor
	syscall	
	lw $a0, ZeroThree
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			#Create the slot for (1,3) in our board	
	lw $a0, Floor
	syscall
	lw $a0, OneThree
	syscall
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			#Create the slot for (2,3) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, TwoThree
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (3,3) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, ThreeThree
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (4,3) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, FourThree
	syscall
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (5,3) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, FiveThree
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (6,3) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, SixThree
	syscall		
	lw $a0, Floor
	syscall		
	lw $a0, Wall
	syscall	
	lw $a0, newline
	syscall
									#Row 2
			 #Create the slot for (0,2) in our board	
	lw $a0, Wall
	syscall	
	lw $a0, Floor
	syscall
	lw $a0, ZeroTwo
	syscall
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			#Create the slot for (1,2) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, OneTwo
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			#Create the slot for (2,2) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, TwoTwo
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (3,2) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, ThreeTwo
	syscall	
	lw $a0, Floor
	syscall
	lw $a0, Wall
	syscall
			 #Create the slot for (4,2) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, FourTwo
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (5,2) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, FiveTwo
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (6,2) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, SixTwo
	syscall		
	lw $a0, Floor
	syscall		
	lw $a0, Wall
	syscall	
	lw $a0, newline
	syscall
									#Row 1
			 #Create the slot for (0,0) in our board
	lw $a0, Wall
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, ZeroOne
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			#Create the slot for (1,1) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, OneOne
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			#Create the slot for (2,1) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, TwoOne
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (3,1) in our board
	lw $a0, Floor
	syscall	
	lw $a0, ThreeOne
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (4,1) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, FourOne
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (5,1) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, FiveOne
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (6,1) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, SixOne
	syscall		
	lw $a0, Floor
	syscall		
	lw $a0, Wall
	syscall	
	lw $a0, newline
	syscall
									#Row 0
			 #Create the slot for (0,0) in our board
	lw $a0, Wall
	syscall	
	lw $a0, Floor
	syscall
	lw $a0, ZeroZero
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			#Create the slot for (1,0) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, OneZero
	syscall
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			#Create the slot for (2,0) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, TwoZero
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			#Create the slot for (3,0) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, ThreeZero
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (4,0) in our board
	lw $a0, Floor
	syscall	
	lw $a0, FourZero
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (5,0) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, FiveZero
	syscall	
	lw $a0, Floor
	syscall	
	lw $a0, Wall
	syscall
			 #Create the slot for (6,0) in our board	
	lw $a0, Floor
	syscall	
	lw $a0, SixZero
	syscall		
	lw $a0, Floor
	syscall		
	lw $a0, Wall
	syscall	
	lw $a0, newline
	syscall
.end_macro


	
.macro checkWin

		

		lw $t3, Floor

	

		jal checkPosZeroZeroH

		jal checkPosOneZeroH

		jal checkPosTwoZeroH

		jal checkPosThreeZeroH

		

		jal checkPosZeroOneH

		jal checkPosOneOneH

		jal checkPosTwoOneH

		jal checkPosThreeOneH

		

		jal checkPosZeroTwoH

		jal checkPosOneTwoH

		jal checkPosTwoTwoH

		jal checkPosThreeTwoH

		

		jal checkPosZeroThreeH

		jal checkPosOneThreeH

		jal checkPosTwoThreeH

		jal checkPosThreeThreeH

		

		jal checkPosZeroFourH

		jal checkPosOneFourH

		jal checkPosTwoFourH

		jal checkPosThreeFourH

		

		jal checkPosZeroFiveH

		jal checkPosOneFiveH

		jal checkPosTwoFiveH

		jal checkPosThreeFiveH

		

		

		jal checkPosZeroZeroV

		jal checkPosZeroOneV

		jal checkPosZeroTwoV

		

		jal checkPosOneZeroV

		jal checkPosOneOneV

		jal checkPosOneTwoV

		

		jal checkPosTwoZeroV

		jal checkPosTwoOneV

		jal checkPosTwoTwoV

		

		jal checkPosThreeZeroV

		jal checkPosThreeOneV

		jal checkPosThreeTwoV

		

		jal checkPosFourZeroV

		jal checkPosFourOneV

		jal checkPosFourTwoV

		

		jal checkPosFiveZeroV

		jal checkPosFiveOneV

		jal checkPosFiveTwoV

		

		jal checkPosSixZeroV

		jal checkPosSixOneV

		jal checkPosSixTwoV

		

		

		jal checkPosZeroZeroDR

		jal checkPosZeroOneDR

		jal checkPosZeroTwoDR

		

		jal checkPosOneZeroDR

		jal checkPosOneOneDR

		jal checkPosOneTwoDR

		

		jal checkPosTwoZeroDR

		jal checkPosTwoOneDR

		jal checkPosTwoTwoDR

		

		jal checkPosThreeZeroDR

		jal checkPosThreeOneDR

		jal checkPosThreeTwoDR

		

		

		jal checkPosThreeZeroDL

		jal checkPosThreeOneDL

		jal checkPosThreeTwoDL

		

		jal checkPosFourZeroDL

		jal checkPosFourOneDL

		jal checkPosFourTwoDL

		

		jal checkPosFiveZeroDL

		jal checkPosFiveOneDL

		jal checkPosFiveTwoDL

		

		jal checkPosSixZeroDL

		jal checkPosSixOneDL

		jal checkPosSixTwoDL

		

		jal checkTie

		

		beq $s1, 1, continueOne

		beq $s1, 2, continueTwo

		

		



	

			#__________________________START_TIE_CHECK____________________________________

			checkTie:

				checkTie1:

					lw $t3, Floor

					lw $t0, ZeroFive

					bne $t0, $t3, checkTie2

					jr $ra

				checkTie2:

					lw $t3, Floor

					lw $t0, OneZero

					bne $t0, $t3, checkTie3

					jr $ra

				checkTie3:

					lw $t3, Floor

					lw $t0, TwoFive

					bne $t0, $t3, checkTie4

					jr $ra

				checkTie4:

					lw $t3, Floor

					lw $t0, ThreeFive

					bne $t0, $t3, checkTie5

					jr $ra

				checkTie5:

					lw $t3, Floor

					lw $t0, FourFive

					bne $t0, $t3, checkTie6

					jr $ra

				checkTie6:

					lw $t3, Floor

					lw $t0, FiveFive

					bne $t0, $t3, checkTie7

					jr $ra		

				checkTie7:

					lw $t3, Floor

					lw $t0, SixFive

					bne $t0, $t3, GameTie

					jr $ra								

		

			#__________________________START_HORIZONTAL_CHECK_____________________________

			checkPosZeroZeroH:

				checkZeroZero1:

					lw $t3, Floor

					lw $t0, ZeroZero

					lw $t1,	OneZero

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneZero1

					jr $ra

				checkOneZero1:

					lw $t0, OneZero

					lw $t1,	TwoZero

					beq $t0, $t1, checkTwoZero1

					jr $ra

				checkTwoZero1:

					lw $t0, TwoZero

					lw $t1,	ThreeZero

					beq $t0, $t1, GameWin

					jr $ra

			

			#_____________________________________________________________________________

			checkPosOneZeroH:

				checkOneZero2:

					lw $t3, Floor

					lw $t0, OneZero

					lw $t1,	TwoZero

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoZero2

					jr $ra

				checkTwoZero2:

					lw $t0, TwoZero

					lw $t1,	ThreeZero

					beq $t0, $t1, checkThreeZero2

					jr $ra

				checkThreeZero2:

					lw $t0, ThreeZero

					lw $t1,	FourZero

					beq $t0, $t1, GameWin

					jr $ra

			#_____________________________________________________________________________ 

			checkPosTwoZeroH:

				checkTwoZero3:

					lw $t3, Floor

					lw $t0, TwoZero

					lw $t1,	ThreeZero

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeZero3

					jr $ra

				checkThreeZero3:

					lw $t0, ThreeZero

					lw $t1,	FourZero

					beq $t0, $t1, checkFourZero3

					jr $ra

				checkFourZero3:

					lw $t0, FourZero

					lw $t1,	FiveZero

					beq $t0, $t1, GameWin

					jr $ra

					

			#_____________________________________________________________________________

			checkPosThreeZeroH:

				checkThreeZero4:

					lw $t3, Floor

					lw $t0, ThreeZero

					lw $t1,	FourZero

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourZero4

					jr $ra

				checkFourZero4:

					lw $t0, FourZero

					lw $t1,	FiveZero

					beq $t0, $t1, checkFiveZero4

					jr $ra

				checkFiveZero4:

					lw $t0, FiveZero

					lw $t1,	SixZero

					beq $t0, $t1, GameWin

					jr $ra

				

			#_____________________________________________________________________________						

			checkPosZeroOneH:

				checkZeroOne5:

					lw $t3, Floor

					lw $t0, ZeroOne

					lw $t1,	OneOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneOne5

					jr $ra

				checkOneOne5:

					lw $t0, OneOne

					lw $t1,	TwoOne

					beq $t0, $t1, checkTwoOne5

					jr $ra

				checkTwoOne5:

					lw $t0, TwoOne

					lw $t1,	ThreeOne

					beq $t0, $t1, GameWin

					jr $ra



			#_____________________________________________________________________________		

			checkPosOneOneH:

				checkOneOne6:

					lw $t3, Floor

					lw $t0, OneOne

					lw $t1,	TwoOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoOne6

					jr $ra

				checkTwoOne6:

					lw $t0, TwoOne

					lw $t1,	ThreeOne

					beq $t0, $t1, checkThreeOne6

					jr $ra

				checkThreeOne6:

					lw $t0, ThreeOne

					lw $t1,	FourOne

					beq $t0, $t1, GameWin

					jr $ra

			

			#_____________________________________________________________________________			

			checkPosTwoOneH:

				checkTwoOne7:

					lw $t3, Floor

					lw $t0, TwoOne

					lw $t1,	ThreeOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeOne7

					jr $ra

				checkThreeOne7:

					lw $t0, ThreeOne

					lw $t1,	FourOne

					beq $t0, $t1, checkFourOne7

					jr $ra

				checkFourOne7:

					lw $t0, FourOne

					lw $t1,	FiveOne

					beq $t0, $t1, GameWin

					jr $ra

			

			#_____________________________________________________________________________			

			checkPosThreeOneH:

				checkThreeOne8:

					lw $t3, Floor

					lw $t0, ThreeOne

					lw $t1,	FourOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourOne8

					jr $ra

				checkFourOne8:

					lw $t0, FourOne

					lw $t1,	FiveOne

					beq $t0, $t1, checkFiveOne8

					jr $ra

				checkFiveOne8:

					lw $t0, FiveOne

					lw $t1,	SixOne

					beq $t0, $t1, GameWin

					jr $ra

					

			#_____________________________________________________________________________			

			checkPosZeroTwoH:

				checkZeroTwo9:

					lw $t3, Floor

					lw $t0, ZeroTwo

					lw $t1,	OneTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneTwo9

					jr $ra

				checkOneTwo9:

					lw $t0, OneTwo

					lw $t1,	TwoTwo

					beq $t0, $t1, checkTwoTwo9

					jr $ra

				checkTwoTwo9:

					lw $t0, TwoTwo

					lw $t1,	ThreeTwo

					beq $t0, $t1, GameWin

					jr $ra

		

			#_____________________________________________________________________________	

			checkPosOneTwoH:

				checkOneTwo10:

					lw $t3, Floor

					lw $t0, OneTwo

					lw $t1,	TwoTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoTwo10

					jr $ra

				checkTwoTwo10:

					lw $t0, TwoTwo

					lw $t1,	ThreeTwo

					beq $t0, $t1, checkThreeTwo10

					jr $ra

				checkThreeTwo10:

					lw $t0, ThreeTwo

					lw $t1,	FourTwo

					beq $t0, $t1, GameWin

					jr $ra

			

			#_____________________________________________________________________________			

			checkPosTwoTwoH:

				checkTwoTwo11:

					lw $t3, Floor

					lw $t0, TwoTwo

					lw $t1,	ThreeTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeTwo11

					jr $ra

				checkThreeTwo11:

					lw $t0, ThreeTwo

					lw $t1,	FourTwo

					beq $t0, $t1, checkFourTwo11

					jr $ra

				checkFourTwo11:

					lw $t0, FourTwo

					lw $t1,	FiveTwo

					beq $t0, $t1, GameWin

					jr $ra

			

			#_____________________________________________________________________________			

			checkPosThreeTwoH:

				checkThreeTwo12:

					lw $t3, Floor

					lw $t0, ThreeTwo

					lw $t1,	FourTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourTwo12

					jr $ra

				checkFourTwo12:

					lw $t0, FourTwo

					lw $t1,	FiveTwo

					beq $t0, $t1, checkFiveTwo12

					jr $ra

				checkFiveTwo12:

					lw $t0, FiveTwo

					lw $t1,	SixTwo

					beq $t0, $t1, GameWin

					jr $ra

					

			#_____________________________________________________________________________			

			checkPosZeroThreeH:

				checkZeroThree13:

					lw $t3, Floor

					lw $t0, ZeroThree

					lw $t1,	OneThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneThree13

					jr $ra

				checkOneThree13:

					lw $t0, OneThree

					lw $t1,	TwoThree

					beq $t0, $t1, checkTwoThree13

					jr $ra

				checkTwoThree13:

					lw $t0, TwoThree

					lw $t1,	ThreeThree

					beq $t0, $t1, GameWin

					jr $ra		

					

			#_____________________________________________________________________________			

			checkPosOneThreeH:

				checkOneThree14:

					lw $t3, Floor

					lw $t0, OneThree

					lw $t1,	TwoThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoThree14

					jr $ra

				checkTwoThree14:

					lw $t0, TwoThree

					lw $t1,	ThreeThree

					beq $t0, $t1, checkThreeThree14

					jr $ra

				checkThreeThree14:

					lw $t0, ThreeThree

					lw $t1,	FourThree

					beq $t0, $t1, GameWin

					jr $ra	

			

			#_____________________________________________________________________________			

			checkPosTwoThreeH:

				checkTwoThree15:

					lw $t3, Floor

					lw $t0, TwoThree

					lw $t1,	ThreeThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeThree15

					jr $ra

				checkThreeThree15:

					lw $t0, ThreeThree

					lw $t1,	FourThree

					beq $t0, $t1, checkFourThree15

					jr $ra

				checkFourThree15:

					lw $t0, FourThree

					lw $t1,	FiveThree

					beq $t0, $t1, GameWin

					jr $ra	

													

			#_____________________________________________________________________________			

			checkPosThreeThreeH:

				checkThreeThree16:

					lw $t3, Floor

					lw $t0, ThreeThree

					lw $t1,	FourThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourThree16

					jr $ra

				checkFourThree16:

					lw $t0, FourThree

					lw $t1,	FiveThree

					beq $t0, $t1, checkFiveThree16

					jr $ra

				checkFiveThree16:

					lw $t0, FiveThree

					lw $t1,	SixThree

					beq $t0, $t1, GameWin

					jr $ra				



			#_____________________________________________________________________________			

			checkPosZeroFourH:

				checkZeroFour17:

					lw $t3, Floor

					lw $t0, ZeroFour

					lw $t1,	OneFour

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneFour17

					jr $ra

				checkOneFour17:

					lw $t0, OneFour

					lw $t1,	TwoFour

					beq $t0, $t1, checkTwoFour17

					jr $ra

				checkTwoFour17:

					lw $t0, TwoFour

					lw $t1,	ThreeFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#_____________________________________________________________________________			

			checkPosOneFourH:

				checkOneFour18:

					lw $t3, Floor

					lw $t0, OneFour

					lw $t1,	TwoFour

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoFour18

					jr $ra

				checkTwoFour18:

					lw $t0, TwoFour

					lw $t1,	ThreeFour

					beq $t0, $t1, checkThreeFour18

					jr $ra

				checkThreeFour18:

					lw $t0, ThreeFour

					lw $t1,	FourFour

					beq $t0, $t1, GameWin

					jr $ra	

			

			#_____________________________________________________________________________			

			checkPosTwoFourH:

				checkTwoFour19:

					lw $t3, Floor

					lw $t0, TwoFour

					lw $t1,	ThreeFour

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeFour19

					jr $ra

				checkThreeFour19:

					lw $t0, ThreeFour

					lw $t1,	FourFour

					beq $t0, $t1, checkFourFour19

					jr $ra

				checkFourFour19:

					lw $t0, FourFour

					lw $t1,	FiveFour

					beq $t0, $t1, GameWin

					jr $ra	

													

			#_____________________________________________________________________________			

			checkPosThreeFourH:

				checkThreeFour20:

					lw $t3, Floor

					lw $t0, ThreeFour

					lw $t1,	FourFour

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourFour20

					jr $ra

				checkFourFour20:

					lw $t0, FourFour

					lw $t1,	FiveFour

					beq $t0, $t1, checkFiveFour20

					jr $ra

				checkFiveFour20:

					lw $t0, FiveFour

					lw $t1,	SixFour

					beq $t0, $t1, GameWin

					jr $ra	

		

			#_____________________________________________________________________________			

			checkPosZeroFiveH:

				checkZeroFive21:

					lw $t3, Floor

					lw $t0, ZeroFive

					lw $t1,	OneFive

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneFive21

					jr $ra

				checkOneFive21:

					lw $t0, OneFive

					lw $t1,	TwoFive

					beq $t0, $t1, checkTwoFive21

					jr $ra

				checkTwoFive21:

					lw $t0, TwoFive

					lw $t1,	ThreeFive

					beq $t0, $t1, GameWin

					jr $ra		

					

			#_____________________________________________________________________________			

			checkPosOneFiveH:

				checkOneFive22:

					lw $t3, Floor

					lw $t0, OneFive

					lw $t1,	TwoFive

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoFive22

					jr $ra

				checkTwoFive22:

					lw $t0, TwoFive

					lw $t1,	ThreeFive

					beq $t0, $t1, checkThreeFive22

					jr $ra

				checkThreeFive22:

					lw $t0, ThreeFive

					lw $t1,	FourFive

					beq $t0, $t1, GameWin

					jr $ra	

			

			#_____________________________________________________________________________			

			checkPosTwoFiveH:

				checkTwoFive23:

					lw $t3, Floor

					lw $t0, TwoFive

					lw $t1,	ThreeFive

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeFive23

					jr $ra

				checkThreeFive23:

					lw $t0, ThreeFive

					lw $t1,	FourFive

					beq $t0, $t1, checkFourFive23

					jr $ra

				checkFourFive23:

					lw $t0, FourFive

					lw $t1,	FiveFive

					beq $t0, $t1, GameWin

					jr $ra	

													

			#_____________________________________________________________________________			

			checkPosThreeFiveH:

				checkThreeFive24:

					lw $t3, Floor

					lw $t0, ThreeFive

					lw $t1,	FourFive

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourFive24

					jr $ra

				checkFourFive24:

					lw $t0, FourFive

					lw $t1,	FiveFive

					beq $t0, $t1, checkFiveFive24

					jr $ra

				checkFiveFive24:

					lw $t0, FiveFive

					lw $t1,	SixFive

					beq $t0, $t1, GameWin

					jr $ra	

					

			#___________________________END_HORIZONTAL_CHECK_______________________________

			#___________________________START_VERTICAL_CHECK_______________________________

			

			#______________________________________________________________________________

			checkPosZeroZeroV:

				checkZeroZero25:

					lw $t3, Floor

					lw $t0, ZeroZero

					lw $t1,	ZeroOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkZeroOne25

					jr $ra

				checkZeroOne25:

					lw $t0, ZeroOne

					lw $t1,	ZeroTwo

					beq $t0, $t1, checkZeroTwo25

					jr $ra

				checkZeroTwo25:

					lw $t0, ZeroTwo

					lw $t1,	ZeroThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosZeroOneV:

				checkZeroOne26:

					lw $t3, Floor

					lw $t0, ZeroOne

					lw $t1,	ZeroTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkZeroTwo26

					jr $ra

				checkZeroTwo26:

					lw $t0, ZeroTwo

					lw $t1,	ZeroThree

					beq $t0, $t1, checkZeroThree26

					jr $ra

				checkZeroThree26:

					lw $t0, ZeroThree

					lw $t1,	ZeroFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosZeroTwoV:

				checkZeroTwo27:

					lw $t3, Floor

					lw $t0, ZeroTwo

					lw $t1,	ZeroThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkZeroThree27

					jr $ra

				checkZeroThree27:

					lw $t0, ZeroThree

					lw $t1,	ZeroFour

					beq $t0, $t1, checkZeroFour27

					jr $ra

				checkZeroFour27:

					lw $t0, ZeroFour

					lw $t1,	ZeroFive

					beq $t0, $t1, GameWin

					jr $ra	

					

			#______________________________________________________________________________

			checkPosOneZeroV:

				checkOneZero28:

					lw $t3, Floor

					lw $t0, OneZero

					lw $t1,	OneOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneOne28

					jr $ra

				checkOneOne28:

					lw $t0, OneOne

					lw $t1,	OneTwo

					beq $t0, $t1, checkOneTwo28

					jr $ra

				checkOneTwo28:

					lw $t0, OneTwo

					lw $t1,	OneThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosOneOneV:

				checkOneOne29:

					lw $t3, Floor

					lw $t0, OneOne

					lw $t1,	OneTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneTwo29

					jr $ra

				checkOneTwo29:

					lw $t0, OneTwo

					lw $t1,	OneThree

					beq $t0, $t1, checkOneThree29

					jr $ra

				checkOneThree29:

					lw $t0, OneThree

					lw $t1,	OneFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosOneTwoV:

				checkOneTwo30:

					lw $t3, Floor

					lw $t0, OneTwo

					lw $t1,	OneThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneThree30

					jr $ra

				checkOneThree30:

					lw $t0, OneThree

					lw $t1,	OneFour

					beq $t0, $t1, checkOneFour30

					jr $ra

				checkOneFour30:

					lw $t0, OneFour

					lw $t1,	OneFive

					beq $t0, $t1, GameWin

					jr $ra	

					

			#______________________________________________________________________________

			checkPosTwoZeroV:

				checkTwoZero31:

					lw $t3, Floor

					lw $t0, TwoZero

					lw $t1,	TwoOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoOne31

					jr $ra

				checkTwoOne31:

					lw $t0, TwoOne

					lw $t1,	TwoTwo

					beq $t0, $t1, checkTwoTwo31

					jr $ra

				checkTwoTwo31:

					lw $t0, TwoTwo

					lw $t1,	TwoThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosTwoOneV:

				checkTwoOne32:

					lw $t3, Floor

					lw $t0, TwoOne

					lw $t1,	TwoTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoTwo32

					jr $ra

				checkTwoTwo32:

					lw $t0, TwoTwo

					lw $t1,	TwoThree

					beq $t0, $t1, checkTwoThree32

					jr $ra

				checkTwoThree32:

					lw $t0, TwoThree

					lw $t1,	TwoFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosTwoTwoV:

				checkTwoTwo33:

					lw $t3, Floor

					lw $t0, TwoTwo

					lw $t1,	TwoThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoThree33

					jr $ra

				checkTwoThree33:

					lw $t0, TwoThree

					lw $t1,	TwoFour

					beq $t0, $t1, checkTwoFour33

					jr $ra

				checkTwoFour33:

					lw $t0, TwoFour

					lw $t1,	TwoFive

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosThreeZeroV:

				checkThreeZero34:

					lw $t3, Floor

					lw $t0, ThreeZero

					lw $t1,	ThreeOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeOne34

					jr $ra

				checkThreeOne34:

					lw $t0, ThreeOne

					lw $t1,	ThreeTwo

					beq $t0, $t1, checkThreeTwo34

					jr $ra

				checkThreeTwo34:

					lw $t0, ThreeTwo

					lw $t1,	ThreeThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosThreeOneV:

				checkThreeOne35:

					lw $t3, Floor

					lw $t0, ThreeOne

					lw $t1,	ThreeTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeTwo35

					jr $ra

				checkThreeTwo35:

					lw $t0, ThreeTwo

					lw $t1,	ThreeThree

					beq $t0, $t1, checkThreeThree35

					jr $ra

				checkThreeThree35:

					lw $t0, ThreeThree

					lw $t1,	ThreeFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosThreeTwoV:

				checkThreeTwo36:

					lw $t3, Floor

					lw $t0, ThreeTwo

					lw $t1,	ThreeThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeThree36

					jr $ra

				checkThreeThree36:

					lw $t0, ThreeThree

					lw $t1,	ThreeFour

					beq $t0, $t1, checkThreeFour36

					jr $ra

				checkThreeFour36:

					lw $t0, ThreeFour

					lw $t1,	ThreeFive

					beq $t0, $t1, GameWin

					jr $ra			

					

			#______________________________________________________________________________

			checkPosFourZeroV:

				checkFourZero37:

					lw $t3, Floor

					lw $t0, FourZero

					lw $t1,	FourOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourOne37

					jr $ra

				checkFourOne37:

					lw $t0, FourOne

					lw $t1,	FourTwo

					beq $t0, $t1, checkFourTwo37

					jr $ra

				checkFourTwo37:

					lw $t0, FourTwo

					lw $t1,	FourThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosFourOneV:

				checkFourOne38:

					lw $t3, Floor

					lw $t0, FourOne

					lw $t1,	FourTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourTwo38

					jr $ra

				checkFourTwo38:

					lw $t0, FourTwo

					lw $t1,	FourThree

					beq $t0, $t1, checkFourThree38

					jr $ra

				checkFourThree38:

					lw $t0, FourThree

					lw $t1,	FourFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosFourTwoV:

				checkFourTwo39:

					lw $t3, Floor

					lw $t0, FourTwo

					lw $t1,	FourThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourThree39

					jr $ra

				checkFourThree39:

					lw $t0, FourThree

					lw $t1,	FourFour

					beq $t0, $t1, checkFourFour39

					jr $ra

				checkFourFour39:

					lw $t0, FourFour

					lw $t1,	FourFive

					beq $t0, $t1, GameWin

					jr $ra			

					

			#______________________________________________________________________________

			checkPosFiveZeroV:

				checkFiveZero40:

					lw $t3, Floor

					lw $t0, FiveZero

					lw $t1,	FiveOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFiveOne40

					jr $ra

				checkFiveOne40:

					lw $t0, FiveOne

					lw $t1,	FiveTwo

					beq $t0, $t1, checkFiveTwo40

					jr $ra

				checkFiveTwo40:

					lw $t0, FiveTwo

					lw $t1,	FiveThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosFiveOneV:

				checkFiveOne41:

					lw $t3, Floor

					lw $t0, FiveOne

					lw $t1,	FiveTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFiveTwo41

					jr $ra

				checkFiveTwo41:

					lw $t0, FiveTwo

					lw $t1,	FiveThree

					beq $t0, $t1, checkFiveThree41

					jr $ra

				checkFiveThree41:

					lw $t0, FiveThree

					lw $t1,	FiveFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosFiveTwoV:

				checkFiveTwo42:

					lw $t3, Floor

					lw $t0, FiveTwo

					lw $t1,	FiveThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFiveThree42

					jr $ra

				checkFiveThree42:

					lw $t0, FiveThree

					lw $t1,	FiveFour

					beq $t0, $t1, checkFiveFour42

					jr $ra

				checkFiveFour42:

					lw $t0, FiveFour

					lw $t1,	FiveFive

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosSixZeroV:

				checkSixZero43:

					lw $t3, Floor

					lw $t0, SixZero

					lw $t1,	SixOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkSixOne43

					jr $ra

				checkSixOne43:

					lw $t0, SixOne

					lw $t1,	SixTwo

					beq $t0, $t1, checkSixTwo43

					jr $ra

				checkSixTwo43:

					lw $t0, SixTwo

					lw $t1,	SixThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosSixOneV:

				checkSixOne44:

					lw $t3, Floor

					lw $t0, SixOne

					lw $t1,	SixTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkSixTwo44

					jr $ra

				checkSixTwo44:

					lw $t0, SixTwo

					lw $t1,	SixThree

					beq $t0, $t1, checkSixThree44

					jr $ra

				checkSixThree44:

					lw $t0, SixThree

					lw $t1,	SixFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosSixTwoV:

				checkSixTwo45:

					lw $t3, Floor

					lw $t0, SixTwo

					lw $t1,	SixThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkSixThree45

					jr $ra

				checkSixThree45:

					lw $t0, SixThree

					lw $t1,	SixFour

					beq $t0, $t1, checkSixFour45

					jr $ra

				checkSixFour45:

					lw $t0, SixFour

					lw $t1,	SixFive

					beq $t0, $t1, GameWin

					jr $ra		

			

			#_________________________END_VERTICAL_CHECK____________________________________

			#_______________________START_DIAGONAL_CHECK______UPRIGHT_______________________	

			

			#______________________________________________________________________________

			checkPosZeroZeroDR:

				checkZeroZero46:

					lw $t3, Floor

					lw $t0, ZeroZero

					lw $t1,	OneOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneOne46

					jr $ra

				checkOneOne46:

					lw $t0, OneOne

					lw $t1,	TwoTwo

					beq $t0, $t1, checkTwoTwo46

					jr $ra

				checkTwoTwo46:

					lw $t0, TwoTwo

					lw $t1,	ThreeThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosZeroOneDR:

				checkZeroOne47:

					lw $t3, Floor

					lw $t0, ZeroOne

					lw $t1,	OneTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneTwo47

					jr $ra

				checkOneTwo47:

					lw $t0, OneTwo

					lw $t1,	TwoThree

					beq $t0, $t1, checkTwoThree47

					jr $ra

				checkTwoThree47:

					lw $t0, TwoThree

					lw $t1,	ThreeFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosZeroTwoDR:

				checkZeroTwo48:

					lw $t3, Floor

					lw $t0, ZeroTwo

					lw $t1,	OneThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkOneThree48

					jr $ra

				checkOneThree48:

					lw $t0, OneThree

					lw $t1,	TwoFour

					beq $t0, $t1, checkTwoFour48

					jr $ra

				checkTwoFour48:

					lw $t0, TwoFour

					lw $t1,	ThreeFive

					beq $t0, $t1, GameWin

					jr $ra	

					

			#______________________________________________________________________________

			checkPosOneZeroDR:

				checkOneZero49:

					lw $t3, Floor

					lw $t0, OneZero

					lw $t1,	TwoOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoOne49

					jr $ra

				checkTwoOne49:

					lw $t0, TwoOne

					lw $t1,	ThreeTwo

					beq $t0, $t1, checkThreeTwo49

					jr $ra

				checkThreeTwo49:

					lw $t0, ThreeTwo

					lw $t1,	FourThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosOneOneDR:

				checkOneOne50:

					lw $t3, Floor

					lw $t0, OneOne

					lw $t1,	TwoTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoTwo50

					jr $ra

				checkTwoTwo50:

					lw $t0, TwoTwo

					lw $t1,	ThreeThree

					beq $t0, $t1, checkThreeThree50

					jr $ra

				checkThreeThree50:

					lw $t0, ThreeThree

					lw $t1,	FourFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosOneTwoDR:

				checkOneTwo51:

					lw $t3, Floor

					lw $t0, OneTwo

					lw $t1,	TwoThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoThree51

					jr $ra

				checkTwoThree51:

					lw $t0, OneThree

					lw $t1,	TwoFour

					beq $t0, $t1, checkThreeFour51

					jr $ra

				checkThreeFour51:

					lw $t0, ThreeFour

					lw $t1,	FourFive

					beq $t0, $t1, GameWin

					jr $ra	

					

			#______________________________________________________________________________

			checkPosTwoZeroDR:

				checkTwoZero52:

					lw $t3, Floor

					lw $t0, TwoZero

					lw $t1,	ThreeOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeOne52

					jr $ra

				checkThreeOne52:

					lw $t0, ThreeOne

					lw $t1,	FourTwo

					beq $t0, $t1, checkFourTwo52

					jr $ra

				checkFourTwo52:

					lw $t0, FourTwo

					lw $t1,	FiveThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosTwoOneDR:

				checkTwoOne53:

					lw $t3, Floor

					lw $t0, TwoOne

					lw $t1,	ThreeTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeTwo53

					jr $ra

				checkThreeTwo53:

					lw $t0, ThreeTwo

					lw $t1,	FourThree

					beq $t0, $t1, checkFourThree53

					jr $ra

				checkFourThree53:

					lw $t0, FourThree

					lw $t1,	FiveFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosTwoTwoDR:

				checkTwoTwo54:

					lw $t3, Floor

					lw $t0, TwoTwo

					lw $t1,	ThreeThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeThree54

					jr $ra

				checkThreeThree54:

					lw $t0, ThreeThree

					lw $t1,	FourFour

					beq $t0, $t1, checkFourFour54

					jr $ra

				checkFourFour54:

					lw $t0, FourFour

					lw $t1,	FiveFive

					beq $t0, $t1, GameWin

					jr $ra	

					

			#______________________________________________________________________________

			checkPosThreeZeroDR:

				checkThreeZero55:

					lw $t3, Floor

					lw $t0, ThreeZero

					lw $t1,	FourOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourOne55

					jr $ra

				checkFourOne55:

					lw $t0, FourOne

					lw $t1,	FiveTwo

					beq $t0, $t1, checkFiveTwo55

					jr $ra

				checkFiveTwo55:

					lw $t0, FiveTwo

					lw $t1,	SixThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosThreeOneDR:

				checkThreeOne56:

					lw $t3, Floor

					lw $t0, ThreeOne

					lw $t1, FourTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourTwo56

					jr $ra

				checkFourTwo56:

					lw $t0, FourTwo

					lw $t1,	FiveThree

					beq $t0, $t1, checkFiveThree56

					jr $ra

				checkFiveThree56:

					lw $t0, FiveThree

					lw $t1,	SixFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosThreeTwoDR:

				checkThreeTwo57:

					lw $t3, Floor

					lw $t0, ThreeTwo

					lw $t1,	FourThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourThree57

					jr $ra

				checkFourThree57:

					lw $t0, FourThree

					lw $t1,	FiveFour

					beq $t0, $t1, checkFiveFour57

					jr $ra

				checkFiveFour57:

					lw $t0, FiveFour

					lw $t1,	SixFive

					beq $t0, $t1, GameWin

					jr $ra	

					

			#______________________END_DIAGONAL_CHECK_____UPRIGHT___________________________

			#____________________BEGIN_DIAGONAL_CHECK_____UPLEFT____________________________

			

			#______________________________________________________________________________

			checkPosThreeZeroDL:

				checkThreeZero58:

					lw $t3, Floor

					lw $t0, ThreeZero

					lw $t1,	TwoOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoOne58

					jr $ra

				checkTwoOne58:

					lw $t0, TwoOne

					lw $t1,	OneTwo

					beq $t0, $t1, checkOneTwo58

					jr $ra

				checkOneTwo58:

					lw $t0, OneTwo

					lw $t1,	ZeroThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosThreeOneDL:

				checkThreeOne59:

					lw $t3, Floor

					lw $t0, ThreeOne

					lw $t1,	TwoTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoTwo59

					jr $ra

				checkTwoTwo59:

					lw $t0, TwoTwo

					lw $t1,	OneThree

					beq $t0, $t1, checkOneThree59

					jr $ra

				checkOneThree59:

					lw $t0, OneThree

					lw $t1,	ZeroFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosThreeTwoDL:

				checkThreeTwo60:

					lw $t3, Floor

					lw $t0, ThreeTwo

					lw $t1,	TwoThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkTwoThree60

					jr $ra

				checkTwoThree60:

					lw $t0, TwoThree

					lw $t1,	OneFour

					beq $t0, $t1, checkOneFour60

					jr $ra

				checkOneFour60:

					lw $t0, OneFour

					lw $t1,	ZeroFive

					beq $t0, $t1, GameWin

					jr $ra			

					lw $t3, Floor

					

			#_______________________________________________________________________

			checkPosFourZeroDL:

				checkFourZero61:

					lw $t3, Floor

					lw $t0, FourZero

					lw $t1,	ThreeOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeOne61

					jr $ra

				checkThreeOne61:

					lw $t0, ThreeOne

					lw $t1,	TwoTwo

					beq $t0, $t1, checkTwoTwo61

					jr $ra

				checkTwoTwo61:

					lw $t0, TwoTwo

					lw $t1,	OneThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosFourOneDL:

				checkThreeOne62:

					lw $t3, Floor

					lw $t0, FourOne

					lw $t1,	ThreeTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeTwo62

					jr $ra

				checkThreeTwo62:

					lw $t0, ThreeTwo

					lw $t1,	TwoThree

					beq $t0, $t1, checkTwoThree62

					jr $ra

				checkTwoThree62:

					lw $t0, TwoThree

					lw $t1,	OneFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosFourTwoDL:

				checkFourTwo63:

					lw $t3, Floor

					lw $t0, FourTwo

					lw $t1,	ThreeThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkThreeThree63

					jr $ra

				checkThreeThree63:

					lw $t0, ThreeThree

					lw $t1,	TwoFour

					beq $t0, $t1, checkTwoFour63

					jr $ra

				checkTwoFour63:

					lw $t0, TwoFour

					lw $t1,	OneFive

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosFiveZeroDL:

				checkFiveZero64:

					lw $t3, Floor

					lw $t0, FiveZero

					lw $t1,	FourOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourOne64

					jr $ra

				checkFourOne64:

					lw $t0, FourOne

					lw $t1,	ThreeTwo

					beq $t0, $t1, checkThreeTwo64

					jr $ra

				checkThreeTwo64:

					lw $t0, ThreeTwo

					lw $t1,	TwoThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosFiveOneDL:

				checkFiveOne65:

					lw $t3, Floor

					lw $t0, FiveOne

					lw $t1,	FourTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourTwo65

					jr $ra

				checkFourTwo65:

					lw $t0, FourTwo

					lw $t1,	ThreeThree

					beq $t0, $t1, checkThreeThree65

					jr $ra

				checkThreeThree65:

					lw $t0, ThreeThree

					lw $t1,	TwoFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosFiveTwoDL:

				checkFiveTwo66:

					lw $t3, Floor

					lw $t0, FiveTwo

					lw $t1,	FourThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFourThree66

					jr $ra

				checkFourThree66:

					lw $t0, ThreeThree

					lw $t1,	TwoFour

					beq $t0, $t1, checkThreeFour66

					jr $ra

				checkThreeFour66:

					lw $t0, ThreeFour

					lw $t1,	TwoFive

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosSixZeroDL:

				checkSixZero67:

					lw $t3, Floor

					lw $t0, SixZero

					lw $t1,	FiveOne

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFiveOne67

					jr $ra

				checkFiveOne67:

					lw $t0, FiveOne

					lw $t1,	FourTwo

					beq $t0, $t1, checkFourTwo67

					jr $ra

				checkFourTwo67:

					lw $t0, FourTwo

					lw $t1,	ThreeThree

					beq $t0, $t1, GameWin

					jr $ra		



			#______________________________________________________________________________

			checkPosSixOneDL:

				checkSixOne68:

					lw $t3, Floor

					lw $t0, SixOne

					lw $t1,	FiveTwo

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFiveTwo68

					jr $ra

				checkFiveTwo68:

					lw $t0, FiveTwo

					lw $t1,	FourThree

					beq $t0, $t1, checkFourThree68

					jr $ra

				checkFourThree68:

					lw $t0, FourThree

					lw $t1,	ThreeFour

					beq $t0, $t1, GameWin

					jr $ra		

					

			#______________________________________________________________________________

			checkPosSixTwoDL:

				checkSixTwo69:

					lw $t3, Floor

					lw $t0, SixTwo

					lw $t1,	ThreeThree

					beq $t0, $t3, emptySpace

					beq $t0, $t1, checkFiveThree69

					jr $ra

				checkFiveThree69:

					lw $t0, FiveThree

					lw $t1,	FourFour

					beq $t0, $t1, checkFourFour69

					jr $ra

				checkFourFour69:

					lw $t0, FourFour

					lw $t1,	ThreeFive

					beq $t0, $t1, GameWin

					jr $ra									

			

			#________________________END_DIAGONAL_CHECK___UPLEFT___________________________

																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									

	emptySpace:

			jr $ra

		

	GameTie:

			li $v0, 4

			la $a0, PlayerTie

			syscall

			j Exit

		

	GameWin:

			beq $s1, 2, PlayerOneWin

			beq $s1, 1, PlayerTwoWin

	PlayerOneWin:

			li $v0, 4

			la $a0, Player1Win

			syscall

			j Exit

			

	PlayerTwoWin:

			li $v0, 4

			la $a0, Player2Win

			syscall

			j Exit

.end_macro

	
main:
		li $v0, 4		#Greet the Users!
		la $a0, greeting
		syscall
		DrawBoard		#Display the Board
		
		li $v0, 4		#Display the choice to play against AI or human
		la $a0, AI_or_PvP
		syscall
		li $v0, 5
		syscall
		#For choosing between playing against the AI or another player
		beq $v0, 1, PvE
		beq $v0, 2, PvP
#Initialize the saved register to 3 for MIPSNet to work
PvE:
	li $s2, 3
	j playerOne
#Continue for player vs. player
PvP:
	j playerOne
		

#*****PLAYER ONE COMMANDS*******************************************************************************************
playerOne:	li $s1, 1		#Flag for player turn: 1 = Player One, 2 = Player Two
		checkWin
continueOne:
		li $v0, 4		#Prompt Player One to enter a column
		la $a0, entryOne
		syscall			
		li $v0, 5		#Read in Player One's Entry
		syscall



		
		move $t1, $v0		#Move the entry to $t1 and branch to appropriate action
		JingleOne
		beq $t1, 0, enteredZero
		beq $t1, 1, enteredOne
		beq $t1, 2, enteredTwo
		beq $t1, 3, enteredThree
		beq $t1, 4, enteredFour
		beq $t1, 5, enteredFive
		beq $t1, 6, enteredSix
		li $v0, 4
		la $a0, invalid
		syscall
		
		j playerOne
#*****PLAYER TWO COMMANDS*****		
playerTwo:	
		li $s1, 2		#Flag for player turn: 1 = Player One, 2 = Player Two		
		checkWin
continueTwo:	
		#For if MIPSNet AI is chosen for player 2
		beq $s2, 3, MIPSNet
		li $v0, 4		#Prompt Player Two to enter a column
		la $a0, entryTwo
		syscall	
		li $v0, 5		#Read in Player Two's Entry
		syscall
		
		move $t1, $v0		#Move the entry to $t1 and branch to appropriate action
		JingleTwo
MIPSBEQ:	
		#MIPSNet will use the random number generated to place the piece
		beq $t1, 0, enteredZero
		beq $t1, 1, enteredOne
		beq $t1, 2, enteredTwo
		beq $t1, 3, enteredThree
		beq $t1, 4, enteredFour
		beq $t1, 5, enteredFive
		beq $t1, 6, enteredSix
		li $v0, 4
		la $a0, invalid
		syscall
		j playerTwo	
		#___________________________________________________________________________________________________	
MIPSNet:
		#Generate a random number 0-6 for a random AI
		li $a0, 0
		li $a1, 6
		li $v0, 42
		syscall
		#Move the random number to t1 for jumping to the proper placing macro
		move $t1, $a0
		
		j MIPSBEQ
					
						
												
enteredZero: 	lw $t1, colZero			#Jump here if player entered Zero
		beq $t1, 0, changeZeroZero
		beq $t1, 1, changeZeroOne
		beq $t1, 2, changeZeroTwo
		beq $t1, 3, changeZeroThree
		beq $t1, 4, changeZeroFour
		beq $t1, 5, changeZeroFive
		li $v0, 4
		la $a0, invalid
		syscall
		beq $s1, 1, playerOne
		beq $s1, 2, playerTwo
		
changeZeroZero:	 
			 beq $s1, 1, ZeroZero1
			 beq $s1, 2, ZeroZero2
	ZeroZero1:	 li $t1, 0x58		#Change the position of (0,0) in the board to an X
			 sw $t1, ZeroZero     		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerTwo
	ZeroZero2:	 li $t1, 0x4f		#Change the position of (0,0) in the board to an O
			 sw $t1, ZeroZero     		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerOne
changeZeroOne: 		 beq $s1, 1, ZeroOne1
			 beq $s1, 2, ZeroOne2
	ZeroOne1:	 li $t1, 0x58		#Change the position of (0,1) in the board to an X
			 sw $t1, ZeroOne     		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerTwo
	ZeroOne2:	 li $t1, 0x4f		#Change the position of (0,1) in the board to an O
			 sw $t1, ZeroOne   		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerOne
changeZeroTwo:  	 beq $s1, 1, ZeroTwo1
			 beq $s1, 2, ZeroTwo2
	ZeroTwo1:	 li $t1, 0x58		#Change the position of (0,2) in the board to an X
			 sw $t1, ZeroTwo     		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerTwo
	ZeroTwo2:	 li $t1, 0x4f		#Change the position of (0,2) in the board to an O
			 sw $t1, ZeroTwo 		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerOne
changeZeroThree:	 beq $s1, 1, ZeroThree1
			 beq $s1, 2, ZeroThree2
	ZeroThree1:	 li $t1, 0x58		#Change the position of (0,3) in the board to an X
			 sw $t1, ZeroThree   		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerTwo
	ZeroThree2:	 li $t1, 0x4f		#Change the position of (0,3) in the board to an O
			 sw $t1, ZeroThree 		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerOne
changeZeroFour: 	 beq $s1, 1, ZeroFour1
			 beq $s1, 2, ZeroFour2
	ZeroFour1:	 li $t1, 0x58		#Change the position of (0,4) in the board to an X
			 sw $t1, ZeroFour    		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerTwo
	ZeroFour2:	 li $t1, 0x4f		#Change the position of (0,4) in the board to an O
			 sw $t1, ZeroFour 		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerOne
changeZeroFive: 	 beq $s1, 1, ZeroFive1
			 beq $s1, 2, ZeroFive2
	ZeroFive1:	 li $t1, 0x58		#Change the position of (0,2) in the board to an X
			 sw $t1, ZeroFive   		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerTwo
	ZeroFive2:	 li $t1, 0x4f		#Change the position of (0,2) in the board to an O
			 sw $t1, ZeroFive		 
			 lw $t2, colZero
			 addi $t2, $t2, 1
			 sw $t2, colZero
			 DrawBoard
		 	 j playerOne
enteredOne: 	lw $t1, colOne			#Jump here if player entered One
		beq $t1, 0, changeOneZero
		beq $t1, 1, changeOneOne
		beq $t1, 2, changeOneTwo
		beq $t1, 3, changeOneThree
		beq $t1, 4, changeOneFour
		beq $t1, 5, changeOneFive
		li $v0, 4
		la $a0, invalid
		syscall
		beq $s1, 1, playerOne
		beq $s1, 2, playerTwo
		
changeOneZero:	 
			 beq $s1, 1, OneZero1
			 beq $s1, 2, OneZero2
	OneZero1:	 li $t1, 0x58		#Change the position of (1,0) in the board to an X
			 sw $t1, OneZero     		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerTwo
	OneZero2:	 li $t1, 0x4f		#Change the position of (1,0) in the board to an O
			 sw $t1, OneZero     		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerOne
changeOneOne: 		 beq $s1, 1, OneOne1
			 beq $s1, 2, OneOne2
	OneOne1:	 li $t1, 0x58		#Change the position of (1,1) in the board to an X
			 sw $t1, OneOne     		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerTwo
	OneOne2:	 li $t1, 0x4f		#Change the position of (1,1) in the board to an O
			 sw $t1, OneOne   		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerOne
changeOneTwo:	  	 beq $s1, 1, OneTwo1
			 beq $s1, 2, OneTwo2
	OneTwo1:	 li $t1, 0x58		#Change the position of (1,2) in the board to an X
			 sw $t1, OneTwo     		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerTwo
	OneTwo2:	 li $t1, 0x4f		#Change the position of (1,2) in the board to an O
			 sw $t1, OneTwo 		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerOne
changeOneThree:	  	 beq $s1, 1, OneThree1
			 beq $s1, 2, OneThree2
	OneThree1:	 li $t1, 0x58		#Change the position of (1,3) in the board to an X
			 sw $t1, OneThree     		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerTwo
	OneThree2:	 li $t1, 0x4f		#Change the position of (1,3) in the board to an O
			 sw $t1, OneThree		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerOne
changeOneFour:	  	 beq $s1, 1, OneFour1
			 beq $s1, 2, OneFour2
	OneFour1:	 li $t1, 0x58		#Change the position of (1,4) in the board to an X
			 sw $t1, OneFour    		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerTwo
	OneFour2:	 li $t1, 0x4f		#Change the position of (1,4) in the board to an O
			 sw $t1, OneFour		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerOne
changeOneFive:	  	 beq $s1, 1, OneFive1
			 beq $s1, 2, OneFive2
	OneFive1:	 li $t1, 0x58		#Change the position of (1,5) in the board to an X
			 sw $t1, OneFive    		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerTwo
	OneFive2:	 li $t1, 0x4f		#Change the position of (1,5) in the board to an O
			 sw $t1, OneFive		 
			 lw $t2, colOne
			 addi $t2, $t2, 1
			 sw $t2, colOne
			 DrawBoard
		 	 j playerOne
enteredTwo: 	lw $t1, colTwo			#Jump here if player entered Two
		beq $t1, 0, changeTwoZero
		beq $t1, 1, changeTwoOne
		beq $t1, 2, changeTwoTwo
		beq $t1, 3, changeTwoThree
		beq $t1, 4, changeTwoFour
		beq $t1, 5, changeTwoFive
		li $v0, 4
		la $a0, invalid
		syscall
		beq $s1, 1, playerOne
		beq $s1, 2, playerTwo
		
changeTwoZero:	 
			 beq $s1, 1, TwoZero1
			 beq $s1, 2, TwoZero2
	TwoZero1:	 li $t1, 0x58		#Change the position of (2,0) in the board to an X
			 sw $t1, TwoZero     		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerTwo
	TwoZero2:	 li $t1, 0x4f		#Change the position of (2,0) in the board to an O
			 sw $t1, TwoZero     		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerOne
changeTwoOne: 		 beq $s1, 1, TwoOne1
			 beq $s1, 2, TwoOne2
	TwoOne1:	 li $t1, 0x58		#Change the position of (2,1) in the board to an X
			 sw $t1, TwoOne     		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerTwo
	TwoOne2:	 li $t1, 0x4f		#Change the position of (2,1) in the board to an O
			 sw $t1, TwoOne   		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerOne
changeTwoTwo:	  	 beq $s1, 1, TwoTwo1
			 beq $s1, 2, TwoTwo2
	TwoTwo1:	 li $t1, 0x58		#Change the position of (2,2) in the board to an X
			 sw $t1, TwoTwo     		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerTwo
	TwoTwo2:	 li $t1, 0x4f		#Change the position of (2,2) in the board to an O
			 sw $t1, TwoTwo 		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerOne
changeTwoThree:	  	 beq $s1, 1, TwoThree1
			 beq $s1, 2, TwoThree2
	TwoThree1:	 li $t1, 0x58		#Change the position of (2,3) in the board to an X
			 sw $t1, TwoThree     		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerTwo
	TwoThree2:	 li $t1, 0x4f		#Change the position of (2,3) in the board to an O
			 sw $t1, TwoThree		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerOne
changeTwoFour:	  	 beq $s1, 1, TwoFour1
			 beq $s1, 2, TwoFour2
	TwoFour1:	 li $t1, 0x58		#Change the position of (2,4) in the board to an X
			 sw $t1, TwoFour    		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerTwo
	TwoFour2:	 li $t1, 0x4f		#Change the position of (2,4) in the board to an O
			 sw $t1, TwoFour		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerOne
changeTwoFive:	  	 beq $s1, 1, TwoFive1
			 beq $s1, 2, TwoFive2
	TwoFive1:	 li $t1, 0x58		#Change the position of (2,5) in the board to an X
			 sw $t1, TwoFive    		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerTwo
	TwoFive2:	 li $t1, 0x4f		#Change the position of (2,5) in the board to an O
			 sw $t1, TwoFive		 
			 lw $t2, colTwo
			 addi $t2, $t2, 1
			 sw $t2, colTwo
			 DrawBoard
		 	 j playerOne
enteredThree: 	lw  $t1, colThree			#Jump here if player entered Three
		beq $t1, 0, changeThreeZero
		beq $t1, 1, changeThreeOne
		beq $t1, 2, changeThreeTwo
		beq $t1, 3, changeThreeThree
		beq $t1, 4, changeThreeFour
		beq $t1, 5, changeThreeFive
		li $v0, 4
		la $a0, invalid
		syscall
		beq $s1, 1, playerOne
		beq $s1, 2, playerTwo
		
changeThreeZero:	 
			 beq $s1, 1, ThreeZero1
			 beq $s1, 2, ThreeZero2
	ThreeZero1:	 li $t1, 0x58		#Change the position of (3,0) in the board to an X
			 sw $t1, ThreeZero     		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerTwo
	ThreeZero2:	 li $t1, 0x4f		#Change the position of (3,0) in the board to an O
			 sw $t1, ThreeZero     		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerOne
changeThreeOne:		 beq $s1, 1, ThreeOne1
			 beq $s1, 2, ThreeOne2
	ThreeOne1:	 li $t1, 0x58		#Change the position of (3,1) in the board to an X
			 sw $t1, ThreeOne     		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerTwo
	ThreeOne2:	 li $t1, 0x4f		#Change the position of (3,1) in the board to an O
			 sw $t1, ThreeOne   		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerOne
changeThreeTwo:	  	 beq $s1, 1, ThreeTwo1
			 beq $s1, 2, ThreeTwo2
	ThreeTwo1:	 li $t1, 0x58		#Change the position of (3,2) in the board to an X
			 sw $t1, ThreeTwo     		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerTwo
	ThreeTwo2:	 li $t1, 0x4f		#Change the position of (3,2) in the board to an O
			 sw $t1, ThreeTwo 		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerOne
changeThreeThree:	 beq $s1, 1, ThreeThree1
			 beq $s1, 2, ThreeThree2
	ThreeThree1:	 li $t1, 0x58		#Change the position of (3,3) in the board to an X
			 sw $t1, ThreeThree     		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerTwo
	ThreeThree2:	 li $t1, 0x4f		#Change the position of (3,3) in the board to an O
			 sw $t1, ThreeThree		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerOne
changeThreeFour:  	 beq $s1, 1, ThreeFour1
			 beq $s1, 2, ThreeFour2
	ThreeFour1:	 li $t1, 0x58		#Change the position of (3,4) in the board to an X
			 sw $t1, ThreeFour    		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerTwo
	ThreeFour2:	 li $t1, 0x4f		#Change the position of (3,4) in the board to an O
			 sw $t1, ThreeFour		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerOne
changeThreeFive:  	 beq $s1, 1, ThreeFive1
			 beq $s1, 2, ThreeFive2
	ThreeFive1:	 li $t1, 0x58		#Change the position of (2,5) in the board to an X
			 sw $t1, ThreeFive    		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerTwo
	ThreeFive2:	 li $t1, 0x4f		#Change the position of (2,5) in the board to an O
			 sw $t1, ThreeFive		 
			 lw $t2, colThree
			 addi $t2, $t2, 1
			 sw $t2, colThree
			 DrawBoard
		 	 j playerOne
enteredFour: 	lw  $t1, colFour			#Jump here if player entered Four
		beq $t1, 0, changeFourZero
		beq $t1, 1, changeFourOne
		beq $t1, 2, changeFourTwo
		beq $t1, 3, changeFourThree
		beq $t1, 4, changeFourFour
		beq $t1, 5, changeFourFive
		li $v0, 4
		la $a0, invalid
		syscall
		beq $s1, 1, playerOne
		beq $s1, 2, playerTwo
		
changeFourZero:	 
			 beq $s1, 1, FourZero1
			 beq $s1, 2, FourZero2
	FourZero1:	 li $t1, 0x58		#Change the position of (4,0) in the board to an X
			 sw $t1, FourZero     		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerTwo
	FourZero2:	 li $t1, 0x4f		#Change the position of (4,0) in the board to an O
			 sw $t1, FourZero     		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerOne
changeFourOne:		 beq $s1, 1, FourOne1
			 beq $s1, 2, FourOne2
	FourOne1:	 li $t1, 0x58		#Change the position of (4,1) in the board to an X
			 sw $t1, FourOne     		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerTwo
	FourOne2:	 li $t1, 0x4f		#Change the position of (4,1) in the board to an O
			 sw $t1, FourOne   		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerOne
changeFourTwo:	  	 beq $s1, 1, FourTwo1
			 beq $s1, 2, FourTwo2
	FourTwo1:	 li $t1, 0x58		#Change the position of (4,2) in the board to an X
			 sw $t1, FourTwo     		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerTwo
	FourTwo2:	 li $t1, 0x4f		#Change the position of (4,2) in the board to an O
			 sw $t1, FourTwo 		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerOne
changeFourThree:	 beq $s1, 1, FourThree1
			 beq $s1, 2, FourThree2
	FourThree1:	 li $t1, 0x58		#Change the position of (4,3) in the board to an X
			 sw $t1, FourThree     		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerTwo
	FourThree2:	 li $t1, 0x4f		#Change the position of (4,3) in the board to an O
			 sw $t1, FourThree		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerOne
changeFourFour:  	 beq $s1, 1, FourFour1
			 beq $s1, 2, FourFour2
	FourFour1:	 li $t1, 0x58		#Change the position of (4,4) in the board to an X
			 sw $t1, FourFour    		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerTwo
	FourFour2:	 li $t1, 0x4f		#Change the position of (4,4) in the board to an O
			 sw $t1, FourFour		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerOne
changeFourFive:  	 beq $s1, 1, FourFive1
			 beq $s1, 2, FourFive2
	FourFive1:	 li $t1, 0x58		#Change the position of (4,5) in the board to an X
			 sw $t1, FourFive    		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerTwo
	FourFive2:	 li $t1, 0x4f		#Change the position of (4,5) in the board to an O
			 sw $t1, FourFive		 
			 lw $t2, colFour
			 addi $t2, $t2, 1
			 sw $t2, colFour
			 DrawBoard
		 	 j playerOne
enteredFive: 	lw  $t1, colFive			#Jump here if player entered Five
		beq $t1, 0, changeFiveZero
		beq $t1, 1, changeFiveOne
		beq $t1, 2, changeFiveTwo
		beq $t1, 3, changeFiveThree
		beq $t1, 4, changeFiveFour
		beq $t1, 5, changeFiveFive
		li $v0, 4
		la $a0, invalid
		syscall
		beq $s1, 1, playerOne
		beq $s1, 2, playerTwo
		
changeFiveZero:	 
			 beq $s1, 1, FiveZero1
			 beq $s1, 2, FiveZero2
	FiveZero1:	 li $t1, 0x58		#Change the position of (5,0) in the board to an X
			 sw $t1, FiveZero     		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerTwo
	FiveZero2:	 li $t1, 0x4f		#Change the position of (5,0) in the board to an O
			 sw $t1, FiveZero     		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerOne
changeFiveOne:		 beq $s1, 1, FiveOne1
			 beq $s1, 2, FiveOne2
	FiveOne1:	 li $t1, 0x58		#Change the position of (5,1) in the board to an X
			 sw $t1, FiveOne     		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerTwo
	FiveOne2:	 li $t1, 0x4f		#Change the position of (5,1) in the board to an O
			 sw $t1, FiveOne   		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerOne
changeFiveTwo:	  	 beq $s1, 1, FiveTwo1
			 beq $s1, 2, FiveTwo2
	FiveTwo1:	 li $t1, 0x58		#Change the position of (5,2) in the board to an X
			 sw $t1, FiveTwo     		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerTwo
	FiveTwo2:	 li $t1, 0x4f		#Change the position of (5,2) in the board to an O
			 sw $t1, FiveTwo 		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerOne
changeFiveThree:	 beq $s1, 1, FiveThree1
			 beq $s1, 2, FiveThree2
	FiveThree1:	 li $t1, 0x58		#Change the position of (5,3) in the board to an X
			 sw $t1, FiveThree     		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerTwo
	FiveThree2:	 li $t1, 0x4f		#Change the position of (5,3) in the board to an O
			 sw $t1, FiveThree		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerOne
changeFiveFour:  	 beq $s1, 1, FiveFour1
			 beq $s1, 2, FiveFour2
	FiveFour1:	 li $t1, 0x58		#Change the position of (5,4) in the board to an X
			 sw $t1, FiveFour    		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerTwo
	FiveFour2:	 li $t1, 0x4f		#Change the position of (5,4) in the board to an O
			 sw $t1, FiveFour		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerOne
changeFiveFive:  	 beq $s1, 1, FiveFive1
			 beq $s1, 2, FiveFive2
	FiveFive1:	 li $t1, 0x58		#Change the position of (5,5) in the board to an X
			 sw $t1, FiveFive    		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerTwo
	FiveFive2:	 li $t1, 0x4f		#Change the position of (5,5) in the board to an O
			 sw $t1, FiveFive		 
			 lw $t2, colFive
			 addi $t2, $t2, 1
			 sw $t2, colFive
			 DrawBoard
		 	 j playerOne
enteredSix: 	lw  $t1, colSix			#Jump here if player entered Six
		beq $t1, 0, changeSixZero
		beq $t1, 1, changeSixOne
		beq $t1, 2, changeSixTwo
		beq $t1, 3, changeSixThree
		beq $t1, 4, changeSixFour
		beq $t1, 5, changeSixFive
		li $v0, 4
		la $a0, invalid
		syscall
		beq $s1, 1, playerOne
		beq $s1, 2, playerTwo
		
changeSixZero:	 	 beq $s1, 1, SixZero1
			 beq $s1, 2, SixZero2
	SixZero1:	 li $t1, 0x58		#Change the position of (6,0) in the board to an X
			 sw $t1, SixZero     		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerTwo
	SixZero2:	 li $t1, 0x4f		#Change the position of (6,0) in the board to an O
			 sw $t1, SixZero     		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerOne
changeSixOne:		 beq $s1, 1, SixOne1
			 beq $s1, 2, SixOne2
	SixOne1:	 li $t1, 0x58		#Change the position of (6,1) in the board to an X
			 sw $t1, SixOne     		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerTwo
	SixOne2:	 li $t1, 0x4f		#Change the position of (6,1) in the board to an O
			 sw $t1, SixOne   		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerOne
changeSixTwo:	  	 beq $s1, 1, SixTwo1
			 beq $s1, 2, SixTwo2
	SixTwo1:	 li $t1, 0x58		#Change the position of (6,2) in the board to an X
			 sw $t1, SixTwo     		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerTwo
	SixTwo2:	 li $t1, 0x4f		#Change the position of (6,2) in the board to an O
			 sw $t1, SixTwo 		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerOne
changeSixThree:		 beq $s1, 1, SixThree1
			 beq $s1, 2, SixThree2
	SixThree1:	 li $t1, 0x58		#Change the position of (6,3) in the board to an X
			 sw $t1, SixThree     		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerTwo
	SixThree2:	 li $t1, 0x4f		#Change the position of (6,3) in the board to an O
			 sw $t1, SixThree		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerOne
changeSixFour:  	 beq $s1, 1, SixFour1
			 beq $s1, 2, SixFour2
	SixFour1:	 li $t1, 0x58		#Change the position of (6,4) in the board to an X
			 sw $t1, SixFour    		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerTwo
	SixFour2:	 li $t1, 0x4f		#Change the position of (6,4) in the board to an O
			 sw $t1, SixFour		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerOne
changeSixFive:  	 beq $s1, 1, SixFive1
			 beq $s1, 2, SixFive2
	SixFive1:	 li $t1, 0x58		#Change the position of (6,5) in the board to an X
			 sw $t1, SixFive    		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerTwo
	SixFive2:	 li $t1, 0x4f		#Change the position of (6,5) in the board to an O
			 sw $t1, SixFive		 
			 lw $t2, colSix
			 addi $t2, $t2, 1
			 sw $t2, colSix
			 DrawBoard
		 	 j playerOne

			
	
Exit: 
			PlayMusic
			li $v0 10
