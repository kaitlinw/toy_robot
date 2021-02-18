require 'require_all'
require_all 'lib'
describe Robot do
  let(:board) { Board.new }
  let(:robot) { Robot.new(board) }

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
end
