class Luhn

  def initialize number
    @number = number
  end

  def luhnify

    #@number = @number.to_s.reverse

    #@number = @number.chars #reverse, split, and torn a string

    numbers = []

    #@number.digits

    @number.digits.each_with_index do |digit, index|
      # if index.odd?
      #   digit *= 2
      # end

      digit *= 2 if index.odd?

      # if digit > 9
      #   digit -= 9
      # end

      digit -= 9 if digit > 9

      numbers << digit
    end

    numbers.reverse
  end

  def valid?
    num = luhnify

    # total = 0

    # num.each do |n|
    #   total += n
    # end
    #
    # total = num.inject(0) do |sum, num|
    #   sum = sum + num
    # end

    total = num.inject(0, :+)

    total = num.reduce(0, :+)

    if total % 10 == 0
      puts "#{@number} is a valid luhn number"
    end

    luhnify_num = @number + (10 - total % 10)
    puts "new total: #{total + (10 - total % 10)}"
    puts "#{luhnify_num} would be a valid number"
  end
end




l = Luhn.new(3554)
l.valid?
# => false

l = Luhn.new(8763)
l.valid?
# => true
