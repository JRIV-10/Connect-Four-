require './spec/spec_helper.rb' 

RSpec.describe Turn do 
    describe '#initialize' do 
        it 'initializes' do 
            board = Board.new
            player = Player.new('X', 'Joey')
            computer = Player.new('O', 'Computer')
            turn = Turn.new(board, player, computer)
            
            expect(turn).to be_a(Turn)
        end
    end

    describe '#player_turn' do 
        it 'places X for player turn' do 
            board = Board.new
            player = Player.new('X', 'Joey')
            computer = Player.new('O', 'Computer')
            turn = Turn.new(board, player, computer)
           
            expect(turn.validate_user_input('A')).to_not be nil 
            #should return board(matrix)
        end
    end

    describe '#computer_turn' do 
        it 'places O for computer turn' do 
            board = Board.new
            player = Player.new('X', 'Joey')
            computer = Player.new('O', 'Computer')
            turn = Turn.new(board, player, computer)

            expect(turn.computer_turn).to_not be nil 
        end
    end

    describe 'player and computer are able to repeat turn sequence' do 
        it 'allows turn sequence' do 
            board = Board.new
            player = Player.new('X', 'Joey')
            computer = Player.new('O', 'Computer')
            turn = Turn.new(board, player, computer)
 
            expect(turn.validate_user_input('A')).to_not be nil 
            expect(turn.validate_user_input('M')).to eq('Invalid placement. Please enter a letter (A-G) or in a column that is not full')
            
            turn.computer_turn
            expect(turn.validate_computer_input('B')).to_not be nil 
        end
    end

    describe '#horizontal_win?' do
        it 'returns true for horizontal win' do
            board = [['A','B','C','D','E','F','G'],['O','.','O','X','.','O','X'], ['X','.','X','O','.','X','O'],['O','.','X','X','X','X','O'],['X','.','X','X','O','O','X'],['O','.','O','O','X','X','X'], ['X','.','X','O','O','O','X']]

            expect(horizontal_win?(board,'X')).to be true
        end
    
        it 'returns false for no horizontal win' do
            board = [['A','B','C','D','E','F','G'],['O','.','O','X','.','O','X'], ['X','.','X','O','.','X','O'],['O','.','X','X','X','O','O'],['X','.','X','X','O','O','X'],['O','.','O','O','X','X','X'], ['X','.','X','O','O','O','X']]
            
            expect(horizontal_win?(board,'X')).to be false
        end
    end

    describe '#vertical_win?' do
        it 'returns false for no vertical win' do
            board = [['A','B','C','D','E','F','G'],['O','.','O','X','.','O','X'], ['X','.','X','O','.','X','O'],['O','.','X','X','O','X','O'],['X','.','X','X','O','O','X'],['O','.','O','O','X','X','X'], ['X','.','X','O','O','O','X']]
        
            expect(vertical_win?(board,'X')).to be false
        end
    end

    describe '#diagonal_win?' do
        it 'returns true for diagonal win' do
        board = [['A','B','C','D','E','F','G'],['O','.','O','X','.','O','X'], ['X','.','X','O','.','X','O'],['O','.','X','X','X','X','O'],['X','.','X','X','O','O','X'],['O','.','X','O','X','X','X'], ['X','X','X','O','O','O','X']]
        
        expect(diagonal_win?(board,'X')).to be true
        end

        it 'returns false for no diagonal win' do
            board = [['A','B','C','D','E','F','G'],['O','.','O','X','.','O','X'], ['X','.','X','O','.','X','O'],['O','.','X','X','X','X','O'],['X','.','X','O','O','O','X'],['O','.','X','O','X','X','X'], ['X','X','X','O','O','O','X']]

            expect(diagonal_win?(board,'X')).to be false
        end
    end
        
    describe '#check_win' do
        it 'returns true for any win' do
            board = [['A','B','C','D','E','F','G'],['O','.','O','X','.','O','X'], ['X','.','O','O','.','X','O'],['O','.','O','X','X','X','O'],['X','.','O','X','O','O','X'],['O','.','X','O','X','X','X'], ['X','X','X','O','O','O','X']]
            
            expect(check_win?(board,'O')).to be true
        end

        it 'returns false for no win' do
            board = [['A','B','C','D','E','F','G'],['O','.','O','X','.','O','X'], ['X','.','X','O','.','X','O'],['O','.','O','X','X','X','O'],['X','.','O','X','O','O','X'],['O','.','X','O','X','X','X'], ['X','X','X','O','O','O','X']]
            
            expect(check_win?(board,'O')).to be false
        end
    end
end