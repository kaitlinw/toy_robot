require 'require_all'
require_all 'lib'

class Conductor
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

  private

  def setup_game
    @board = Board.new
    @robot = Robot.new(@board)
  end
end