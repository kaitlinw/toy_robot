require 'require_all'
require_all 'lib'

describe Board do
  let(:board) { Board.new }

  it 'creates a 5 x 5 board' do
    expect(board.x_max).to eq 5
    expect(board.y_max).to eq 5
  end

  context '#is_position_allowed?' do
    it 'returns false for x values below 0' do
      expect(board.is_position_allowed?(-1, 0)).to be false
    end

    it 'returns false for x values greater than or equal to the x_max' do
      expect(board.is_position_allowed?(5, 0)).to be false
    end

    it 'returns true for values within 0 and x_max' do
    expect(board.is_position_allowed?(3, 0)).to be true

    end

    it 'returns false for y values below 0' do
      expect(board.is_position_allowed?(0, -1)).to be false
    end

    it 'returns false for y values greater than or equal to the y_max' do
      expect(board.is_position_allowed?(0, 5)).to be false
    end

    it 'returns true for values within 0 and y_max' do
      expect(board.is_position_allowed?(0, 3)).to be true
    end
  end
end
