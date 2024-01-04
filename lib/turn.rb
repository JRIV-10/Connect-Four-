class Turn 
    attr_reader :board,
                :player, 
                :computer
    
    def initialize(board, player, computer)#, placement)
        @board = board 
        @player = player 
        @computer = computer
    end

    def player_turn
        display_board 
        column = get_user_input 
        @board = @board.place_piece(column, 'X')
        @board
    end

    def computer_turn 
        column = get_random_column
        @board.place_piece(column, 'O') 
    end

    def get_random_column
        input = ('A'..'G').to_a.sample
        validate_computer_input(input)
    end 

    def validate_computer_input(input)
        if column_not_full?(input) 
            input 
        else 
            get_random_column
        end
    end

    def display_board 
        StartGame.new.return_board(@board)
    end

    def get_user_input
        input =  gets.chomp 
        validate_user_input(input)
    end

    def validate_user_input(input)
        if ('A'..'G').to_a.include?(input) && column_not_full?(input) 
            puts 'Good Move!'
            display_board
        else 
            get_user_input
            puts 'Invalid placement. Please enter a letter (A-G) or in a column that is not full'
        end
    end

    def column_not_full?(column)
        @board.available_cell(column)!=nil
    end
end
