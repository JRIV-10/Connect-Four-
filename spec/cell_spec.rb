require './spec/spec_helper.rb'

RSpec.describe Cell do 
    describe '#initialize' do 
        it 'can initialize' do 
            cell = Cell.new('A', 6)
            
            expect(cell.column).to eq('A')
            expect(cell.row).to eq(6)
        end 
    end 
end 