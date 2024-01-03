require './spec/spec_helper.rb'

RSpec.describe Cell do 
    describe '#initialize' do 
        it 'can initialize' do 
            cell = Cell.new('A', 6)
            
            expect(cell.column).to eq('A')
            expect(cell.row).to eq(6)
            expect(cell.value).to eq('.')
        end 
    end 

    describe '#empty?' do 
        it 'is empty when initialized' do 
            cell = Cell.new('A', 6)

            expect(cell.empty?).to eq(true) 
        end
    end

    describe '#assign_value' do 
        it 'can store a value' do 
            cell = Cell.new('A', 6)
            
            expect(cell.empty?).to eq(true)

            cell.assign_value('X') 

            expect(cell.empty?).to eq(false)
        end
    end
end 