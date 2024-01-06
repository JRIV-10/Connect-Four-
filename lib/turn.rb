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
        @board.return_board
        turn_sequence
    end

    def computer_turn 
        column = get_random_column
        @board.place_piece(column, 'O') 
    end

    def turn_sequence
        loop do 
            player_turn

            break if game_over? || game.exit_game

            computer_turn

            break if game_over? || game.exit_game
        end
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
        StartGame.new.return_matrix(@board)
    end

    def get_user_input
        input =  gets.chomp 
        message = validate_user_input(input) 
            puts message unless message.nil? 
                input    
    end

    def validate_user_input(input)
        if ('A'..'G').to_a.include?(input) && column_not_full?(input) 
            puts 'Good Move!'
            display_board
        elsif input == 'q'
            'See you next time, goodbye'
        else 
            'Invalid placement. Please enter a letter (A-G) or in a column that is not full'
            # get_user_input
        end
    end

    def column_not_full?(column)
        @board.available_cell(column)!=nil
    end
end
