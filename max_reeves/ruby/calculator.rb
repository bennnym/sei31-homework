# Calculator
# Explanation
# You will be building a calculator. A calculator can perform multiple arithmetic operations. Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.
# Specification:
# A user should be given a menu of operations
# A user should be able to choose from the menu
# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
# This process should continue until the user selects a quit option from the menu
# Phase 1
# Calculator functionality
# Calculator should be able to do basic arithmetic (+,-, *,

require "pry"

#binding.pry

def show_menu
	puts "calculator" #You could .center here to make it look nice
	puts "-=" * 20 #El cheaps divider horizontal line
	puts "[a] - addition"
	puts "-=" * 20
	puts "[s] - subtract"
	puts "-=" * 20
	puts "[m] - multiply"
	puts "-=" * 20
	puts "[d] - division"
	puts "-=" * 20
	puts "[sr] - square root"
	puts "Or press [q] to quit"

end

show_menu
menu_choice = gets.chomp.downcase

until menu_choice == 'q'
	case menu_choice
	when 'a'
		print "Enter a number 1 of 2: "
			firstNumber = gets.to_i
		print "Enter a number 2 of 2: "
			secondNumber = gets.to_i
		puts "Total = #{firstNumber + secondNumber}"
	when 's'
		print "Enter a number 1 of 2: "
			firstNumber = gets.to_i
		print "Enter a number 2 of 2: "
			secondNumber = gets.to_i
		puts "Total = #{firstNumber - secondNumber}"
	when 'm'
		print "Enter a number 1 of 2: "
			firstNumber = gets.to_i
		print "Enter a number 2 of 2: "
			secondNumber = gets.to_i
		puts "Total = #{firstNumber * secondNumber}"
	when 'd'
		print "Enter a number 1 of 2: "
			firstNumber = gets.to_i
		print "Enter a number 2 of 2: "
			secondNumber = gets.to_i
		puts "Total = #{firstNumber / secondNumber}"
	when 'sr'
		print "Enter a number: "
			firstNumber = gets.to_i
		puts "The square root of #{firstNumber} is #{Math.sqrt(firstNumber).floor}"
	else
			puts "Invalid selection"
		end
		show_menu
		menu_choice = gets.chomp.downcase
	end
