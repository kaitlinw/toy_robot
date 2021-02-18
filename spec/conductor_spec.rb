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
