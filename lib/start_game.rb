class StartGame 
    attr_reader :board

    def give_welcome
       puts 'Welcome to CONNECT FOUR\n Enter p to play. Enter q to quit.'
       input =  gets.chomp
       process_main_menu_input(input)
    end

    def process_main_menu_input(input)
        if  input == 'p'
            @board = Board.new
            return_turn_message
            return_matrix(@board)
            "Let's play the game"
        elsif input == 'q'
            exit_game
        else
            'Invalid placement. Please enter p or q'
        end
    end    
    def return_turn_message
        'Please Enter your column selection: letter A to G/n Or feel free to Enter q to quit the game\n  ------------------------------------------------'
    end

    def return_matrix(board)
        board.return_board
    end

    def exit_game
        'See you next time, goodbye'
        exit 
    end
end