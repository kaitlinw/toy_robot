require 'require_all'
require_all 'lib'
describe Conductor do
  let(:conductor) { Conductor.new }

  context '#handle_request' do
    context 'when input is PLACE' do
      it 'calls robot method place' do
        input = 'PLACE 1 0 EAST'

        expect(conductor.robot).to receive(:place).with(input.split)
        conductor.handle_request(input)
      end
    end

    context 'when input is MOVE' do
      it 'calls robot method move' do
        input = 'MOVE'

        expect(conductor.robot).to receive(:move)
        conductor.handle_request(input)
      end
    end

    context 'when input is LEFT' do
      it 'calls robot method left' do
        input = 'LEFT'

        expect(conductor.robot).to receive(:turn_left)
        conductor.handle_request(input)
      end
    end

    context 'when input is RIGHT' do
      it 'calls robot method right' do
        input = 'RIGHT'

        expect(conductor.robot).to receive(:turn_right)
        conductor.handle_request(input)
      end
    end

    context 'when input is REPORT' do
      it 'calls robot method report' do
        expect(conductor.robot).to receive(:report_state)
        conductor.handle_request('PLACE 1 0 EAST')
        conductor.handle_request('REPORT')
      end
    end

    context 'when input is anything else' do
      it 'returns an error message' do
        conductor.handle_request('PLACE 1 0 EAST')

        error_msg = <<~MSG
        Please include valid input. Type 'help' for instructions.
        MSG

        expect{ conductor.handle_request('bananaboat') }.to output(error_msg).to_stdout
      end
    end
  end
end
