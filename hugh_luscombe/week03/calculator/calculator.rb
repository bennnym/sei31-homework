require 'pry'

# binding.pry

def show_menu
  puts "crappy calculator" #TODO: you could .center here to make it look nice
  puts "-=" * 40 # El cheapo divider horizontal line
  puts "[a] - Addition" #TODO: add other options here
  puts "[s] - Subtraction"
  puts "[m] - Multiplication"
  puts "[d] - Division"
  puts "[sq] - Square Root"
  puts "[e] - Exponent"
  puts "[mort] - Mortgage Monthly Repayment"
  puts "[bmi] - Body Mass Index"
  puts "[trip] - Trip Calculator"
  puts "[q] - Quit"
end

show_menu
menu_choice = gets.chomp.downcase

until menu_choice == 'q'
  case menu_choice
  when "a"
    print "Enter first number: "
    first_num = gets.to_i

    print "Enter number to add: "
    second_num = gets.to_i

    puts "Result of addition is #{ first_num + second_num }"
  when "s"
    print "Enter first number: "
    first_num = gets.to_i

    print "Enter number to subtract: "
    second_num = gets.to_i

    puts "Result of subtraction is #{ first_num - second_num }"
  when 'm'
    print "Enter first number: "
    first_num = gets.to_i

    print "Enter number to multiply by: "
    second_num = gets.to_i

    puts "Result of multiplication is #{ first_num * second_num }"
  when 'd'
    print "Enter first number: "
    first_num = gets.to_i

    print "Enter number to divide by: "
    second_num = gets.to_i

    puts "Result of division is #{ first_num / second_num }"
  when 'sq'
    print "Enter the number you wish to find the square root of: "
    sqrt_num = gets.to_i

    puts "The square root of #{sqrt_num} is #{ Integer.sqrt( sqrt_num ) }"
  when 'e'
    print "Enter first number: "
    first_num = gets.to_i

    print "Enter second number"
    second_num = gets.to_i

    puts "#{ first_num } to the power of #{ second_num } is #{ first_num ** second_num }"
  # when 'mort'
  #   print "How much did you borrow?: "
  #   amount_borrowed = gets.to_i
  #
  #   print "What is you yearly interest rate?: "
  #   interest_rate = gets.to_f / 12
  #
  #   print "How many years is your term?: "
  #   total_months = gets.to_i / 12
  #
  #   step_one = (interest_rate + 1) ** total_months
  #   step_two = 1 - step_one
  #   step_three = interest_rate / step_two
  #   repayment = step_three * amount_borrowed
  #
  #   puts "Your monthly repayment is #{repayment}"
  when 'bmi'
    print "What is your weight in kg?: "
    weight = gets.to_f

    print "What is your height in metres?: "
    height = gets.to_f
    bmi = weight / (height ** 2)

    puts "Your BMI is #{ bmi.round(2) }"
  when 'trip'
    print "How far are you travelling in km?: "
    distance = gets.to_f

    print "How fast will you be travelling in km/h?: "
    speed = gets.to_i

    print "How far does a litre of fuel take you?: "
    fuel_distance = gets.to_i

    print "How much does a litre of fuel cost you?: "
    fuel_price = gets.to_i

    puts "Your trip will take #{ distance / speed } hours and  will cost you #{ (distance / fuel_distance) * fuel_price }"
  else
    puts "Invalid selection. You idiot."
  end

  show_menu
  menu_choice = gets.chomp.downcase
end

puts "Thanks for using crappy calculator!"
