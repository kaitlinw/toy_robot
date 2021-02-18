class Robot
  def initialize(board)
    @directions = ["NORTH", "EAST", "SOUTH", "WEST"]
    @board = board
  end

  def place(input_array)
    error_message_position = "Sorry you can not make this move. Please choose legal coordinates."
    error_message_direction = "Sorry you can not make this move. Please choose a legal direction."
    position_x = input_array[1].to_i
    position_y = input_array[2].to_i

    return puts error_message_position unless @board.is_position_allowed?(position_x, position_y)
    set_position(position_x, position_y)

    direction = input_array.select { |input| @directions.include?(input) }

    return puts error_message_direction if direction.empty?
    set_direction(direction.first)
  end

  private

  def set_direction(facing)
    @facing = @directions.find { |direction| direction == facing }
  end

  def set_position(position_x, position_y)
    @position_x = position_x
    @position_y = position_y
  end
end