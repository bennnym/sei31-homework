# class Luhn
#   def initialize number
#     @number = number
#   end
#
#   def luhnify
#     # We want to work fgrom the right, but there is no reverse method for numbers. So let's start with this
#
#     # @number = @number.to_s.reverse
#
#     # But we really this as an array, so we can work with each element and its index. So lwt's add this...
#
#     # @number = @number.chars #['4', '5', '5', '3']
#
#     numbers = []
#
#     # @number.digits #[3, 5, 5, 4]
#
#     @number.digits.each_with_index do |digit, index|
#         if index.odd?
#           digit *= 2
#         end
#
#         if digit > 9
#           digit -= 9
#         end
#
#         numbers << digit
#     end #each_with_index
#
#     numbers.reverse
#   end
#
#   def valid?
#     num = luhnify
#
#     total = 0
#
#     num.each do |n|
#       total += n
#     end
#
#     if total % 10 == 0
#       puts "#{@number} is a valid luhn number"
#     else
#       luhnified_num = @number + (10 - total % 10)
#       puts "new total: #{total + (10 - total % 10)}"
#       puts "#{luhnified_num} would be a valid luhn number"
#     end
#
#     #  If the result does not end in zero, add the difference between 10 and the remainder of check % 10
#
#   end
# end
#
# l = Luhn.new(3554)
# puts l.valid?
#
# # => false
#
# l = Luhn.new(8763)
# puts l.valid?
# # => true


# Refactored Version

class Luhn
  def initialize number
    @number = number
  end

  def luhnify
    numbers = []
    @number.digits.each_with_index do |digit, index|
        # if index.odd?
        #   digit *= 2
        # end

        #REFACTOR
        digit *= 2 if index.odd?

        # if digit > 9
        #   digit -= 9
        # end

        #REFACTOR
        digit -= 9 if digit > 9

        numbers << digit
    end #each_with_index

    numbers.reverse
  end

  def valid?
    num = luhnify

    # total = 0

    # num.each do |n|
    #   total += n
    # end

    # total = num.inject(0) do |sum, num|
    #   sum = sum + num
    # end

    #REFACTOR
    total = num.inject(0, :+) # [0, + 6, + 5, + 1, + 4]
    # OR
    total = num.reduce(0, :+) #[16]

    if total % 10 == 0
      puts "#{@number} is a valid luhn number"
    else
      luhnified_num = @number + (10 - total % 10)
      puts "new total: #{total + (10 - total % 10)}"
      puts "#{luhnified_num} would be a valid luhn number"
    end


  end
end

l = Luhn.new(3554)
puts l.valid?

# => false

l = Luhn.new(8763)
puts l.valid?
# => true
