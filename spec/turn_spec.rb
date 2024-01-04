require './spec/spec_helper.rb' 

RSpec.describe Turn do 
    describe '#initialize' do 
        it 'initializes' do 
            board = Board.new
            player = Player.new('Joey', 'X')
            computer = Player.new('Computer', 'O')
            turn = Turn.new(board, player, computer)
            
            expect(turn).to be_a(Turn)
        end
    end

    describe '#player_turn' do 
        it 'places X for player turn' do 
            board = Board.new
            player = Player.new('Joey', 'X')
            computer = Player.new('Computer', 'O')
            turn = Turn.new(board, player, computer)
           

            expect(turn.validate_user_input('A')).to_not be nil 
        end
    end
end