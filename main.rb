require_relative 'lib/process_input.rb'

loop do
  puts "Enter commands ('q' to quit)"
  input = gets.chomp
  input == 'q' ? break : process_input(input)
end
