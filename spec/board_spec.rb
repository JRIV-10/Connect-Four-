require 'rspec'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
    describe '#Initialize' do
        board = Board.new
        
        expect(board.cells).to be Hash
        expect(board.cells.size).to eq(7)
        expect(board.cells).to eq({'A' => ['.','.','.','.','.','.']})
    end
end