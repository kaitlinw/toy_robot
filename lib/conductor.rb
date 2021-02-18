require 'require_all'
require_all 'lib'

class Conductor
  attr_accessor :robot

  def initialize
    setup_game
  end

  def instructions
    puts ""
    puts "Welcome to Toy Robot! I am the Conductor."
    puts ""
    puts "Here's how to play:"
    puts ""
    puts "First things first, if you want to start playing you must type PLACE before you tell us where you want to *place* the robot."
    puts ""
    puts "You can PLACE the robot in any location on the board with x and y coordinates ranging from 0 to 4."
    puts "Please also specify if your robot is facing north, south, east or west, but not in between!"
    puts "Do not even try to go south-west or 42 degrees!! Your robot has a terrible sense of direction!"
    puts "Type your command like so: place 1 2 south"
    puts ""
    puts "Once your robot is placed, you may move your robot around the board with MOVE."
    puts "Turn left with LEFT, turn right with RIGHT, and report the position of the robot with REPORT."
    puts "The game is case insensitive."
    puts ""
    puts "type 'help' if you need to view these instructions again"
    puts "type 'exit' to exit the game"
    puts ""
    puts "Happy gaming!"
    puts ""
  end

  def handle_request(input)
    @initial_placement ||= validate_game_start?(input)

    @input_array = input.split

    @input_array.map do |word|
      case word
      when "PLACE"
        return @robot.place(@input_array)
      when "MOVE"
        return @robot.move
      when "LEFT"
        return @robot.turn_left
      when "RIGHT"
        return @robot.turn_right
      else
        return puts "Please include valid input. Type 'help' for instructions." if @initial_placement
      end
    end
  end

  private

  def setup_game
    @board = Board.new
    @robot = Robot.new(@board)
  end

  def validate_game_start?(input)
    error_message = "Please type 'PLACE' to start the game followed by the direction and x and y coordinates for your robot.
    E.g. place 2 1 south
    "

    return true if input.include?("PLACE")
    puts error_message
  end
end