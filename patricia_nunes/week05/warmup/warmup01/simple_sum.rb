# Simple Sums - Ruby
# Write a program that can calculate the sum of the first n elements of the following sequences:
#
# s1 = 1 - 1 + 1 - 1 + 1 - 1 + //etc
# s2 = 1 + 2 + 3 + 4 + 5 + 6 + //etc
# For example:
#
# s1(4) = 0
# s2(4) = 10
# Can you guess what the sum would be if n is infinity?


s1 = 1 - 1 + 1 - 1 + 1 - 1 +
s2 = 1 + 2 + 3 + 4 + 5 + 6 +

p s1

p s2

class SimpleSums

  def initialize number
  @number = number
  end

  def print_number
    p @print_number
  end

end

#whenever you call the method new on a class, as in simplecums.new, the class wuil create a new instance of itserl. it will the, internallu call the method initialize on the new object. doing so it eill suplu pass all the arguments yhat you passed to new on to the method initialize
sum = SimmpleSums.new(4)

sum.print_number
