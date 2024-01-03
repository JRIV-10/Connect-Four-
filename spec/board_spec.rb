require 'rspec'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
    describe '#Cells' do
        it 'Initializes, creates cells and stores it on a board' do
            board = Board.new.cells
        
            expect(board.class).to be Hash
            expect(board.size).to eq(7)
            expect(board.keys).to eq(['A', 'B', 'C', 'D', 'E', 'F', 'G'])
            expect(board.values.flatten).to all(be_an_instance_of Cell)
        end
    end
end