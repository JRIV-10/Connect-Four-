class StartGame 
    attr_reader :turn_count

    def initialize
        @turn_count = 0
    end

    def give_welcome
       'Welcome to CONNECT FOUR\n Enter p to play. Enter q to quit.'
    end

    
    def return_board(board)
        puts 'Please Enter your column selection: letter A to G'
        puts ' ------------------------------------------------ '
        
        formatted_board = format_board(board)
        render(formatted_board).join('\n')
    end
    
    def render(board)    
        matrix = Array.new(6) { Array.new(7, '') }
        columns = board.keys
        columns.each_with_index do |key, index|
            column_cells = board[key]
            column_cells.each do |cell|
                matrix[cell.row - 1][index] = cell.value
            end
        end
        matrix.unshift(columns)

        result_matrix = matrix.map { |row| row.join }
    end

    def format_board(board)
        if board.class == Board
            board.board
        elsif board.class == Hash
            board 
        end
    end

    def count_turn
        @turn_count += 1
    end
end