require './spec/spec_helper'
RSpec.describe StartGame do
    describe '#Initializes' do
        it 'Exists' do
            game = StartGame.new

            expect(game).to be_an_instance_of(StartGame)
        end
    end

    describe '#Messages' do
        it 'Returns main menu selection feedback' do
            game = StartGame.new
            input = 'P'
            expect(game.process_main_menu_input(input)).to eq("Let's play the game")

            input = 'Q'
            expect(game.process_main_menu_input(input)).to eq('See you next time, goodbye')
            
            input = 'e'
            expect(game.process_main_menu_input(input)).to eq('Invalid placement. Please enter p or q')
        end

        it 'Returns Turn Message' do
            game = StartGame.new
            @board = Board.new
            
            expect(game.return_turn_message).to eq("Please Enter your column selection: letter A to G/n Or feel free to Enter q to quit the game\n  ------------------------------------------------")
        end
    end

    describe '#horizontal_win?' do
        it 'returns true for horizontal win' do
            board = Board.new
            game = StartGame.new
            board.place_piece('A','X')
            board.place_piece('B','X')
            board.place_piece('C','X')
            board.place_piece('D','X')
            board.place_piece('G','O')
            board.place_piece('A','X')
            
            expect(game.horizontal_win?(board,'X')).to be true
        end

        it 'returns false for no horizontal win' do
            board = Board.new
            game = StartGame.new
            board.place_piece('A','0')
            board.place_piece('B','X')
            board.place_piece('C','X')
            board.place_piece('D','X')
            board.place_piece('G','O')
            board.place_piece('A','X')
            
            expect(game.horizontal_win?(board,'X')).to be false
        end
    end

    describe '#vertical_win?' do
        it 'returns true for vertical win' do
            board = Board.new
            game = StartGame.new
            board.place_piece('A','X')
            board.place_piece('G','O')
            board.place_piece('A','X')
            board.place_piece('F','O')
            board.place_piece('A','X')
            board.place_piece('D','O')
            board.place_piece('A','X')
        
            expect(game.vertical_win?(board,'X')).to be true
        end
        it 'returns false for no vertical win' do
            board = Board.new
            game = StartGame.new
            board.place_piece('C','X')
            board.place_piece('G','O')
            board.place_piece('A','X')
            board.place_piece('F','O')
            board.place_piece('A','X')
            board.place_piece('D','O')
            board.place_piece('A','X')
        
            expect(game.vertical_win?(board,'X')).to be false
        end
    end

    describe '#diagonal_win?' do
        it 'returns true for diagonal win' do
            board = Board.new
            game = StartGame.new
            board.place_piece('A','X')
            board.place_piece('B','O')
            board.place_piece('B','X')
            board.place_piece('C','O')
            board.place_piece('C','O')
            board.place_piece('C','X')
            board.place_piece('D','O')
            board.place_piece('D','O')
            board.place_piece('D','O')
            board.place_piece('D','X')

            expect(game.diagonal_win?(board,'X')).to be true
        end

        it 'returns false for no diagonal win' do
            board = Board.new
            game = StartGame.new
            3.times {board.place_piece('D','X')}
            3.times {board.place_piece('A','X')}
            3.times {board.place_piece('A','O')}
            3.times {board.place_piece('B','X')}
            3.times {board.place_piece('B','O')}
            3.times {board.place_piece('C','X')}
            3.times {board.place_piece('C','O')}
            3.times {board.place_piece('D','O')}
            3.times {board.place_piece('E','X')}
            3.times {board.place_piece('E','O')}
            3.times {board.place_piece('F','X')}
            3.times {board.place_piece('F','O')}
            3.times {board.place_piece('G','X')}
            3.times {board.place_piece('G','O')}

            expect(game.diagonal_win?(board,'X')).to be false
        end
    end

    describe '#draw(board, value)?' do 
        it 'identifies a draw' do 
            board = Board.new
            game = StartGame.new

            3.times {board.place_piece('A','X')}
            3.times {board.place_piece('A','O')}
            3.times {board.place_piece('B','X')}
            3.times {board.place_piece('B','O')}
            3.times {board.place_piece('C','O')}
            3.times {board.place_piece('C','X')}
            board.place_piece('D','O')
            3.times {board.place_piece('D','X')}
            2.times {board.place_piece('D','O')}
            3.times {board.place_piece('E','O')}
            3.times {board.place_piece('E','X')}
            3.times {board.place_piece('F','X')}
            3.times {board.place_piece('F','O')}
            3.times {board.place_piece('G','X')}
            3.times {board.place_piece('G','O')}

            expect(game.draw?(board, 'X')).to be true 
        end
    end
end