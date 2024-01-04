require './spec/spec_helper.rb'

RSpec.describe Player do 
    describe '#initialize' do 
        it 'initializes' do 
            player = Player.new('Player', 'X') 
            computer = Player.new('Computer', 'O')

            expect(player).to be_a(Player)
            expect(computer).to be_a(Player)
        end

        it 'has a name' do 
            player = Player.new('Laura', 'X')

            expect(player.name).to eq('Laura')
        end

        it 'has a piece' do 
            player = Player.new('Laura', 'X')
            computer = Player.new('Computer', 'O')
            
            expect(player.piece).to eq('X')
            expect(computer.piece).to eq('O')
        end
    end
end