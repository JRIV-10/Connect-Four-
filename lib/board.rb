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
        # column_cells = []
        column_cells = @board[column]
        return nil if column_cells.nil? || column_cells.empty?

        column_cells.reverse.find(&:empty?)
    end

    def place_piece(column,value)
        # first_av_cell = available_cell(column).assign_value(value)
        # @board
        first_av_cell = available_cell(column)
        first_av_cell.assign_value(value) if first_av_cell
        return self
        @board 
    end

    def return_board
        render.join("\n")
    end

    def render
        matrix = Array.new(6) { Array.new(7, '') }
        columns = @board.keys
        columns.each_with_index do |key, index|
            column_cells = @board[key]
            column_cells.each do |cell|
                matrix[cell.row - 1][index] = cell.value
            end
        end
        columns = columns.map do |column|
            column.center(3)
        end
        matrix.unshift(columns)

        result_matrix = matrix.map { |row| row.join }
    end

end