require 'require_all'
require_all 'lib'

describe Robot do
  let(:board) { Board.new }
  let(:robot) { Robot.new(board, 'HAL') }

  context '#place' do
    context 'invalid input' do
      it 'returns an error message for position' do
        error_msg = <<~MSG
        Sorry you can not make this move. Please choose legal coordinates.
        MSG

        expect{ robot.place(['PLACE', '5', '1212312', 'south']) }.to output(error_msg).to_stdout
      end

      it 'returns an error message for direction' do
        error_msg = <<~MSG
        Sorry you can not make this move. Please choose a legal direction.
        MSG

        expect{ robot.place(['PLACE', '1', '0', 'not_a_direction']) }.to output(error_msg).to_stdout
      end
    end

    context 'valid input' do
      it 'sets the position of the robot' do
        robot.place(['PLACE', '1', '0', 'EAST'])

        expect(robot.position_x).to eq 1
        expect(robot.position_y).to eq 0
      end

      it 'sets the direction of the robot' do
        robot.place(['PLACE', '1', '0', 'EAST'])

        expect(robot.facing).to eq 'EAST'
      end
    end
  end

  context '#move' do
    context 'when move is not allowed' do
      it 'returns an error message' do
        robot.place(['PLACE', '0', '3', 'WEST'])

        error_msg = <<~MSG
        Sorry you can not make this move. Please choose a different direction.
        MSG

        expect{ robot.move }.to output(error_msg).to_stdout
      end
    end

    context 'when move is allowed' do
      it 'moves the robot north one position' do
        robot.place(['PLACE', '0', '3', 'NORTH'])
        robot.move

        expect(robot.position_y).to eq (4)
      end

      it 'moves the robot east one position' do
        robot.place(['PLACE', '0', '3', 'EAST'])
        robot.move

        expect(robot.position_x).to eq (1)
      end

      it 'moves the robot south one position' do
        robot.place(['PLACE', '0', '3', 'SOUTH'])
        robot.move

        expect(robot.position_y).to eq (2)
      end

      it 'moves the robot west one position' do
        robot.place(['PLACE', '1', '3', 'WEST'])
        robot.move

        expect(robot.position_x).to eq (0)
      end
    end
  end

  context '#turn_right' do
    it 'changes the direction facing' do
      robot.place(['PLACE', '1', '2', 'EAST'])

      expect(robot.turn_right).to eq 'SOUTH'
    end

    context 'when facing west' do
      it 'changes the direction facing to north' do
        robot.place(['PLACE', '1', '2', 'WEST'])

        expect(robot.turn_right).to eq 'NORTH'
      end
    end
  end

  context '#turn_left' do
    it 'changes the direction facing' do
      robot.place(['PLACE', '1', '2', 'EAST'])

      expect(robot.turn_left).to eq 'NORTH'
    end

    context 'when facing north' do
      it 'changes the direction facing to west' do
        robot.place(['PLACE', '1', '2', 'NORTH'])

        expect(robot.turn_left).to eq 'WEST'
      end
    end
  end

  context '#report_state' do
    it 'return the position statement of the robot' do
      robot.place(['PLACE', '1', '3', 'WEST'])

      msg = <<~MSG
      Your robot, HAL, is at location [#{robot.position_x}, #{robot.position_y}] facing #{robot.facing}.
      MSG

      expect{ robot.report_state }.to output(msg).to_stdout
    end
  end
end
