require './spec/spec_helper.rb'

RSpec.describe Player do 
    describe '#initialize' do 
        it 'initializes' do 
            player = Player.new('X', 'Player') 
            computer = Player.new('O', 'Computer')

            expect(player).to be_a(Player)
            expect(computer).to be_a(Player)
        end

        it 'has a name' do 
            player = Player.new('X', 'name')
            
            expect(player.name).to eq('name') 

            computer = Player.new('O', 'Computer')
            
            expect(computer.name).to eq('Computer')
        end

        it 'has a piece' do 
            player = Player.new('X', 'Laura')
            computer = Player.new('O', 'Computer')
            
            expect(player.value).to eq('X')
            expect(computer.value).to eq('O')
        end
    end

    describe '#get_user_name' do 
        it 'prints please enter your name' do 
            player = Player.new('X', 'Laura')
            input = 'Laura'
            
            expect(player.get_user_name(input)).to_not be nil 
        end
    end
end