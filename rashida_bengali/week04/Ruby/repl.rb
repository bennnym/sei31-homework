require ('rainbow')

puts "Welcome to REPL"

print ">>"

input = gets.chomp

until input == "^c"
  colors = Range.new(0,7).to_a
  result = eval(input)
  puts (" => #{result}").chars.map { |char| Rainbow(char).color(colors.sample) }.join
  print ">>"
  input = gets.chomp
end
