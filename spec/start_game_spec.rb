require 'rspec'
require './lib/start_game'
require './lib/cell.rb'
require './lib/board.rb'

RSpec.describe StartGame do
    describe '#Initializes' do
        it 'Exists' do
            game = StartGame.new

            expect(game).to be_an_instance_of(StartGame)
        end
    end

    describe '#Messajes' do
        it 'Returns welcome messaje' do
            game = StartGame.new
            input = 'p'
            expect(game.process_main_menu_input(input)).to eq("Let's play the game")

            input = 'q'
            expect(game.process_main_menu_input(input)).to eq('See you next time, goodbye')
            
            input = 'e'
            expect(game.process_main_menu_input(input)).to eq('Invalid placement. Please enter p or q')
        end

        it 'Renders and returns initial board' do
            game = StartGame.new
            board = Board.new

            expect(game.return_board(board)).to eq(
            'ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......')
        end

        it 'Renders and returns board correctly every time' do
            game = StartGame.new
            board = Board.new
            board1 = board.place_piece('A','X')
            board2 = board.place_piece('A','O')
            board3 = board.place_piece('B','X')
            
            expect(game.return_board(board3)).to eq(
            'ABCDEFG\n.......\n.......\n.......\n.......\nO......\nXX.....')
        end
    end
end