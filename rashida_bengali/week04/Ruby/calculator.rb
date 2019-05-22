require 'pry'
require 'rainbow'

def show_menu
  puts Rainbow("Calculator").purple.bright.center(80) #TODO: you could .center here to make it look nice
  puts Rainbow("-=").orange.bright * 40 # El cheapo divider horizontal line
  puts Rainbow("[a] - Addition").yellow.bright
  puts Rainbow("[s] - Subtraction").red.bright
  puts Rainbow("[m] - Multiplication").green.bright
  puts Rainbow("[d] - Division").blue.bright
  puts Rainbow("[r] - Square root").pink.bright
  puts Rainbow("[e] - Exponent").orange.bright
  puts Rainbow("[l] - Modulus").salmon.bright
  puts Rainbow("[g] - Mortgage").plum.bright
  puts Rainbow("[b] - BMI").gold.bright
  puts Rainbow("[t] - Trip Calculation").aqua.bright
  puts Rainbow("[q] - Quit").purple.bright
end

show_menu

menu_choice = gets.chomp.downcase

binding.pry

until menu_choice == 'q'
  case menu_choice
  when 'a'
    print "Input number_one: "
    number_one = gets.to_f
    print "Input number_two: "
    number_two = gets.to_f
    def add (number_one, number_two)
      result = number_one + number_two
      return result
    end
    puts Rainbow("The answer is #{add number_one, number_two}").yellow.bright
  when 's'
    print "Input number_one: "
    number_one = gets.to_f
    print "Input number_two: "
    number_two = gets.to_f
    def sub (number_one, number_two)
      result = number_one - number_two
      return result
    end
    puts Rainbow("The answer is #{sub number_one, number_two}").red.bright
  when 'm'
    print "Input number_one: "
    number_one = gets.to_f
    print "Input number_two: "
    number_two = gets.to_f
    def mul (number_one, number_two)
      result = number_one * number_two
      return result
    end
    puts Rainbow("The answer is #{mul number_one, number_two}").green.bright
  when 'd'
    print "Input number_one: "
    number_one = gets.to_f
    print "Input number_two: "
    number_two = gets.to_f
    def div (number_one, number_two)
      result = number_one / number_two
      return result
    end
    puts Rainbow("The answer is #{div number_one, number_two}").blue.bright
  when 'r'
    print "Input number: "
    number = gets.to_f
    def root (number)
      result = Math.sqrt(number)
      return result
    end
    puts Rainbow("The answer is #{root number}").pink.bright
  when 'e'
    print "Input number_one: "
    number_one = gets.to_f
    print "Input number_two: "
    number_two = gets.to_f
    def expo (number_one, number_two)
      result = number_one ** number_two
      return result
    end
    puts Rainbow("The answer is #{expo number_one, number_two}").orange.bright
  when 'l'
    print "Input number_one: "
    number_one = gets.to_f
    print "Input number_two: "
    number_two = gets.to_f
    def mod (number_one, number_two)
      result = number_one % number_two
      return result
    end
    puts Rainbow("The remainder is #{mod number_one, number_two}").salmon.bright
  when 'g'
    print "Enter Annual Interest Rate: "
    rate = gets.to_f
    rate = (rate/100) / 12
    print "Enter Mortgage period in years: "
    period = gets.to_f
    period = period * 12
    print "Enter Prinicipal value of Loan: "
    principal = gets.to_f
    def mor (rate, period, principal)
      numerator = rate * ((1 + rate) ** period)
      denominator = ((1 + rate) ** period) - 1
      result = principal * (numerator / denominator)
      return result
    end
    puts Rainbow("The Monthly Mortgage is #{mor rate, period, principal}").plum.bright
  when 'b'
    print "Enter weight in kgs: "
    weight = gets.to_f
    print "Enter height in cms: "
    height = gets.to_f
    def bmi (weight, height)
      result = weight / ((height/100) ** 2)
        if result < 18
          return puts Rainbow("Your BMI is #{result}. You are underweight. Eat more.").gold.bright
        elsif result > 30
          return puts Rainbow("Your BMI is #{result}. You are overweight. Eat less.").gold.bright
        else
          return puts Rainbow("Your BMI is #{result}. You are perfect. Keep it up.").gold.bright
        end
    end
    bmi weight, height
  when 't'
    print "Enter distance to be travelled (in miles): "
    distance = gets.to_f            #125 miles
    print "Enter miles per gallon: " #8km per litre
    miles_gallon = gets.to_f         #5 miles per litre
    print "Enter price per gallon: " #5 miles per 0.3 gallon
    price_gallon = gets.to_f         #17 miles per gallon
    print "Enter speed of travel (in miles/hour): " #40miles/h
    speed = gets.to_f
    def trip_time (distance, speed)
      result = distance / speed
      return result
    end
    puts Rainbow("The Trip will take #{trip_time distance, speed} hours").aqua.bright
    def trip_cost (distance, miles_gallon, price_gallon)
      total_gallons = distance / miles_gallon
      result = total_gallons * price_gallon
      return result
    end
    puts Rainbow("The Trip will cost AUD #{trip_cost distance, miles_gallon, price_gallon}").aqua.bright
  else
    puts Rainbow("Invalid selection").aqua.bright
  end

  show_menu
  menu_choice = gets.chomp.downcase
end

puts Rainbow("Thanks for using crappy calculator!").purple.bright

# The monthly payment equation can be represented as follows: {\displaystyle M=P{\frac {r(1+r)^{n}}{(1+r)^{n}-1}}}.
