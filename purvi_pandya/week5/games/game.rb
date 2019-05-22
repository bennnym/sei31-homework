# Title: Guess The Number
# Activity:
# You are to generate a basic "guess my number" game. The computer will pick a random number between 0 and 10. The user will guess the number until they guess correctly.
# Specification:
# The user should be asked to guess a number
# If the user's guess is correct, the user should see a congratulatory message
# If the user's guess is not correct, the user should be asked to guess the number again.
# Extensions:
# Let the user choose the maximum value (so they can play a long game with a random value between 0 and 10000, for example).
# Give feedback to the user: "Wrong, guess higher!" or "Wrong, guess lower!"
debug_mode = true
print "what is the maximum value"
MAX_VALUE = gets.to_i
number = rand 10
puts "the number is #{number}"
print "guess the correct number from 1 to 10 :"
num = gets.to_i

until number == num
  print "guess the correct number from 1 to 10 :"
  num = gets.to_i
end
if number == num
puts "congratulations."
end
