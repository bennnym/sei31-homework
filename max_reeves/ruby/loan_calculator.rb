def show_wait_cursor(seconds,fps=10)
  chars = %w[| / - \\]
  delay = 1.0/fps
  (seconds*fps).round.times{ |i|
    print chars[i % chars.length]
    sleep delay
    print "\b"
  }
end

def gary
	puts "Hello I'm Your Friendly Neighbourhood Loan Shark, Gary!".center(50)
	puts "*-" * 40
	puts "Would You Like To Take Out A Loan?('Yes' or 'No')"
	puts "The Annual Interest Rate Is 30%"
	puts "*-" * 40
end

gary
meeting_with_gary = gets.chomp.downcase

until meeting_with_gary == 'no'
	case meeting_with_gary
	when 'yes'
		print "How Much Do You Want To Borrow?: "
			borrowedAmount = gets.to_i
    print "How Many Years To You Want To Borrow Over?: "
			termOfLoan = gets.to_i
		puts "Ok, I Can Do That For You, Wait Ill Just Grab Your Cash!"
		show_wait_cursor(4)
		puts"XXXXXXXXXXXXXXXXXXFEDERAL RESERVE NOTEXXXXXXXXXXXXXXXXXXX"
		sleep(0.1)
		puts"XXX  XX       THE UNITED STATES OF AMERICA        XXX  XX"
		sleep(0.1)
		puts"XXXX XX  -------       ------------               XXXX XX"
		sleep(0.1)
		puts"XXXX XX              /   jJ===-            C7675  XXXX XX"
		sleep(0.1)
		puts"XXXXXX     OOO      /   jJ - -  L           ---    XXXXXX"
		sleep(0.1)
		puts"XXXXX     OOOOO     |   JJ  |   X    |       __     XXXXX"
		sleep(0.1)
		puts"XXX    3   OOO      |   JJ ---  X    |      OOOO    3 XXX"
		sleep(0.1)
		puts"XXX                 |   J|     /|    |     OOOOOO     XXX"
		sleep(0.1)
		puts"XXX     C36799887   |   /  |  |      |      OOOO      XXX"
		sleep(0.1)
		puts"XXX                 |  |          |  |       --       XXX"
		sleep(0.1)
		puts"XXX      -------      /              /                XXX"
		sleep(0.1)
		puts"X  XX                  ____________ /               X  XX"
		sleep(0.1)
		puts"XX XXX 3_________        --------  ___   _______ 3 XXX XX"
		sleep(0.1)
		puts"XX XXX            ONE HUNDRED DOLLARS              XXX XX"
		sleep(0.1)
		puts"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		show_wait_cursor(2)
		puts "Here it is >:)"
		puts "You Have To Give Me #{ borrowedAmount * 1.3.round / 12 } Per month"
		puts "Now Make Sure You Pay Up Each Month Or Ill Break Your Legs!"
		show_wait_cursor(5)
		puts "*-" * 40
		puts "*-" * 40
		puts "*-" * 40
	else
			puts "Invalid selection"
	end
		gary
		meeting_with_gary = gets.chomp.downcase
end
