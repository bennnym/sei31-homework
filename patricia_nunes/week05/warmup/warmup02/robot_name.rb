require 'pry'

class Robot

  def initialize
    @name = make_name

    @instruction_count = 0

    #we capture the current time with time class
    @created_at = Time.now.to_i
    @created_at = Time.now.to_i
  end

  #this will create the random name dor the robot
  def make_name
    #create an array with alphabetical range
    letters = ('A'..'B').to_a.sample(2)
    numbers = ('000'..'999').to_a.sample

    name_pool = letters.join.concat(numbers)
  end

  def name
    @instruction_count += 1
    @name
  end

  def reset
    @instruction_count += 1
    @name = make_name
  end

  def instruction_count
    @instruction_count
  end

end

robot1 = Robot.new
puts robot1.name

puts '=' * 20

robot2 = Robot.new
puts robot2.name
sleep 3
robot2.reset
puts robot2.name
puts robot2.instruction_count
