class Turn 
    attr_reader :board,
                :player, 
                :computer,
                :value, 
                :game
    
    def initialize(board, player, computer)
        @board = board 
        @player = player 
        @computer = computer
        @value = value 
        @game = StartGame.new
    end

    def player_turn
        @value = ' X '
        display_board 
        column = get_user_input
        return :quit if column.nil?
        @board = @board.place_piece(column, @value)
    end

    def computer_turn 
        @value = ' O '
        column = get_random_column
        @board = @board.place_piece(column, @value)
        return 'Computer turn'
    end
    
    def display_board 
        if @game && @board
            puts @game.return_matrix(@board)
          else
            puts "No board to display."
            @game.end_game
        end
    end

    def turn_sequence
        loop do 
            player_turn

            return :quit if @value.nil?

            break if @game.game_result(@board, @value) 

            computer_turn

            break if @game.game_result(@board, @value) 
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

    def get_user_input
        input = gets.chomp.upcase
        message = validate_user_input(input) 

        if message
            puts message
            return input
        else
            get_user_input 
        end 
    end

    def validate_user_input(input)
        if input.upcase == 'Q'
            @game.exit_game
            return @game.give_welcome

        elsif ('A'..'G').to_a.include?(input) 
            if column_not_full?(input) 
                puts 'Good Move!'
                return input 
            else 
                puts 'Please choose a column that is not full'
                return nil 
            end 
            # display_board
        
        else 
            puts 'Invalid placement. Please enter a letter (A-G) ' 
            return nil 
        end 
    end

    def column_not_full?(column)
        @board.available_cell(column)!=nil
    end
end
