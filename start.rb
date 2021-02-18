require_relative 'lib/conductor'

#Create conductor
conductor = Conductor.new

#Welcome from conductor
conductor.instructions

#Game start
loop do
  # Prompt for user
  print "> "

  # Simple parse of input
  input = gets.upcase.chomp

  case input
  when "EXIT"
    puts "Goodbye!"
    break
  when "HELP"
    puts conductor.instructions
  end

  conductor.handle_request(input)
end
