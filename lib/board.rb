require 'pry'

class Board
  attr_accessor :x_max, :y_max

  def initialize(x = 5, y = 5)
    @x_max = x
    @y_max = y
    @restricted_tiles = []
  end

  def is_position_allowed?(x, y)
    !(x >= x_max || x < 0 || y >= y_max || y < 0) && !@restricted_tiles.find { |restricted| restricted == [x,y] }
  end

  def restricted_tiles(coordinates)
    @restricted_tiles.push(coordinates)
  end
end