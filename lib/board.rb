class Board
    attr_reader :board
    
    def initialize
        @board = create_cells
    end
    
    def create_cells
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
        column_cells = @board[column]
        column_cells.reverse.find do |cell|
            cell.empty?
        end
    end

    def place_piece(column,value)
        first_av_cell = available_cell(column).assign_value(value)
        @board
    end
end