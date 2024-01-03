class Board
    
    def initialize
        board = Hash.new
    end
    
    def cells
        board = Hash.new
        keys = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
        keys.map do |key|
            values = []
            index = 1
            6.times do 
                values << Cell.new(key , index)
                index += 1
            end
            board[key] = values
        end
        board
    end

    def available_cell(column)
        # @@board[column].find_last do |cell|
        #     cell.empty?
        #     require 'pry'; binding.pry
        # end
        column_cells = cells[column]
        column_cells.reverse.find do |cell|
            cell.empty?
        end
    end

    def place_piece(column,value)
        first_av_cell = available_cell(column)
        cells[column].find do |cell|
            if cell == first_av_cell
                cell.assign_value(value)
            end
        end
    end
end