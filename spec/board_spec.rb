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

        it 'Initializes with all empty cells' do
            board = Board.new.cells
            # require 'pry'; binding.pry
            
            expected = board.values.flatten.all? do |cell| 
                cell.empty?
            end

            expect(expected).to be true
        end
    end

    describe '#place_piece' do
        
        it 'Iterates to find first open available cell in a column' do
            board = Board.new
            #require 'pry'; binding.pry
            # turn_column = 'A'
            # turn_value = 'X'
            # board_result = board.place_piece('A','X')
            new_board = board.place_piece('A','X')
        
            expect(new_board.values).to eq(['.','.','.','.','.','X'])
        end
    end
end