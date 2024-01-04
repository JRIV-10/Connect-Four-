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
        @board.place_piece(column, @player.piece)
    end

    def computer_turn 
        column = get_random_column
        @board.place_piece(column, @computer.piece) if column_not_full?(column)
    end

    def get_random_column
        ('A'..'G').to_a.sample
    end

    def display_board 
        @board.display
    end

    def get_user_input
        puts 'Enter a letter A-G to place your piece'
        input =  gets.chomp 
        validate_user_input(input)
    end

    def validate_user_input(input)
        if ('A'..'G').to_a.include?(input) && column_not_full?(input) 
            puts 'Good Move!'
            input 
        else 
            puts 'Invalid placement. Please enter a letter (A-G) or in a column that is not full'
            get_user_input
        end
    end

    def column_not_full?(column)
        @board.available_cell(column)!=nil
    end
end
