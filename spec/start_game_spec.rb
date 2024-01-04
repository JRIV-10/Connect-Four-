require 'rspec'
require './lib/start_game'
require './lib/cell.rb'
require './lib/board.rb'

RSpec.describe StartGame do
    describe '#Initializes' do
        it 'Exists and starts with no turns' do
            game = StartGame.new

            expect(game).to be_an_instance_of(StartGame)
            expect(game.turn_count).to eq(0)
        end
    end

    describe '#Messajes' do
        it 'Returns welcome messaje' do
            game = StartGame.new

            expect(game.give_welcome).to eq('Welcome to CONNECT FOUR\n Enter p to play. Enter q to quit.')
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

    describe "#Count_turn" do
        it 'Counts the turn when turns are taken' do
            game = StartGame.new
            board = Board.new
            # player = Player.new('Joey', 'X')
            # computer = Player.new('Computer', 'O')
            # turn = Turn.new(board, player, computer)
            
            game.count_turn
            expect(game.turn_count).to eq(1)
        end
    end
end