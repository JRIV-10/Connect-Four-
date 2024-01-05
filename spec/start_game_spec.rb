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

    describe '#Messages' do
        it 'Returns main menu selection feedback' do
            game = StartGame.new
            input = 'p'
            expect(game.process_main_menu_input(input)).to eq("Let's play the game")

            # input = 'q'
            # expect(game.process_main_menu_input(input)).to eq('See you next time, goodbye')
            
            input = 'e'
            expect(game.process_main_menu_input(input)).to eq('Invalid placement. Please enter p or q')
        end

        it 'Returns Turn Message' do
            game = StartGame.new
            @board = Board.new
            
            expect(game.return_turn_message).to eq('Please Enter your column selection: letter A to G/n Or feel free to Enter q to quit the game\n  ------------------------------------------------')
        end
    end

    
end