require 'rspec'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
    describe '#Cells' do
        
        it 'Initializes, creates cells and stores it on a board' do
            board = Board.new
        
            expect(board.class).to be Board
            expect(board.board.class).to be Hash
            expect(board.board.size).to eq(7)
            expect(board.board.keys).to eq(['A', 'B', 'C', 'D', 'E', 'F', 'G'])
            cells_array = board.board.values.flatten.flatten 
            expect(cells_array).to all(be_an_instance_of Cell)
        end

        it 'Initializes with all empty cells' do
            board = Board.new
            # require 'pry'; binding.pry
            cells_array = board.board.values.flatten.flatten
            expected = cells_array.all? do |cell| 
                cell.empty?
            end

            expect(expected).to be true
        end
    end

    describe '#place_piece' do
        
        it 'Iterates to find first open available cell in a column' do
            board = Board.new

            new_board = board.place_piece('A','X')
            new_column = new_board.values.first.map do |cell|
                        cell.value
                        end 
        
            expect(new_column).to eq(['.','.','.','.','.','X'])
        end

        it "Updates board when placing pieces" do
            board = Board.new

            board1 = board.place_piece('A','X')
            board2 = board.place_piece('A','O')
            board3 = board.place_piece('B','X')
            new_columnA = board3.values.first.map do |cell|
                        cell.value
                        end 
            new_columnB = board3.values[1].map do |cell|
                cell.value
                end 
        
            expect(new_columnA).to eq(['.','.','.','.','O','X'])
            expect(new_columnB).to eq(['.','.','.','.','.','X'])

        end
    end
end