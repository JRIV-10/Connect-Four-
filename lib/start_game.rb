class StartGame 
    attr_reader :board, 
                :turn

    def give_welcome
       puts "Welcome to CONNECT FOUR\n Enter p to play. Enter q to quit."
       input =  gets.chomp.upcase
       process_main_menu_input(input)
       create_players_turn
    end

    def process_main_menu_input(input)
        if  input == 'P'
            # player = Player(value, name)
            # @player.get_user_name(name)
            @board = Board.new
            return_turn_message
            return_matrix(@board)
            return "Let's play the game"
        elsif input == 'Q'
            exit_game
        else
            return 'Invalid placement. Please enter p or q'
        end
    end 

    def return_turn_message
        return "Please Enter your column selection: letter A to G/n Or feel free to Enter q to quit the game\n  ------------------------------------------------"
    end

    def return_matrix(board)
        board.return_board
    end

    def exit_game
        return 'See you next time, goodbye'
        exit 
    end

    def create_players_turn
        @user_name = Player.new('X', 'Joey')#.get_user_name(name)
        @computer_name = Player.new('O', 'Computer')
        @turn = Turn.new(@board, @user_name, @computer_name)
        @turn.turn_sequence
    end

    def game_result(board, value)
        if horizontal_win?(board, value) ||
            vertical_win?(board, value) ||
            diagonal_win?(board, value)
            if value == 'X'
                puts "Congrats you won!"
            elsif value == 'O'
                puts "Computer won, Good try!"
            end 
                give_welcome    
                return true 
        elsif draw?(board, value)
            puts "It's a draw, Good Game!"
            # @turn.display_board
            give_welcome
            return true 
        else 
            return false 
        end 
    end

    def draw?(board, value)
        result = false 
        # @turn = Turn.new(board, @user_name, @computer_name)

        board.board.keys.each do |column|
            result = !board.available_cell(column)
        end
        result 
         
        #    if @turn.column_not_full?(column) != true 
        #         result = true 
        #    end 
        # end 
        # result
        # @turn = Turn.new(board, @user_name, @computer_name)
        # if board.board.keys.all? do |column| 
        #     @turn.column_not_full?(column) == nil
        #         return true 
        #     end
        # end 
        #     if board.available_cell(column) != nil 
        #         result = true 
        #     end
        # end
    end

    def horizontal_win?(board, value)
        board.board.values.transpose.each do |row|
            row.each_cons(4) do |four_cells|
                if four_cells.all? { |cell| cell.value == value }
                    return true  
                end
            end 
        end 
        false
    end
    
    def vertical_win?(board, value)
        board.board.values.each do |column|
            column.each_cons(4) do |four_cells|
                if four_cells.all? { |cell| cell.value == value }
                    return true 
                end
            end 
        end
        false
    end

    def diagonal_win?(board, value)
        plain_board = board.board.values
        rows = plain_board.length
        columns = plain_board[0].length
        # Check diagonals from bottom-left to top-right
        (rows - 3).times do |i|
            (columns - 3).times do |j|
                if (0..3).all? { |k| plain_board[i + k][j + k].value == value }
                    return true  
                end
            end 
        end
        # Check diagonals from top-left to bottom-right
        (rows - 3).times do |i|
            (columns - 3).times do |j|
                if (0..3).all? { |k| plain_board[rows - 1 - i - k][j + k].value == value }
                    return true 
                end
            end 
        end
        false 
    end 
end