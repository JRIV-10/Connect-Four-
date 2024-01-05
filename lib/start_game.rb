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

    def create_players_turn
        @user_name = Player.new('X', 'Joey').get_user_name
        @computer_name = 'Computer'
        turn = Turn.new(board, @user_name, @computer_name)
        turn.player_turn
    end

    def check_win(board, value)
        if horizontal_win?(board, value) ||
            vertical_win?(board, value) ||
            diagonal_win?(board, value)
            true 
        else 
            false 
        end 
    end

    def game_result(board, value)
        if value == check_win(board, 'X') 
            'Congrats #{player.get_user_name} you won!'
        else value == draw?(board, 'X')
            "It's a draw, Good Game!"
        end 
    end

    def draw?(board, value)
        result = false 
        board.render[0].each do |column|
           if turn.column_not_full?(column) != true 
                result = true 
           end 
        end 
        result
    end
    
    def horizontal_win?(board, value)
        board.each do |row|
            row.each_cons(4) do |four_cells|
                if four_cells.all? { |cell| cell.value == value }
                    true 
                else 
                    false 
                end
            end 
        end 
    end
    
    def vertical_win?(board, value)
        board.transpose.each do |column|
            column.each_cons(4) do |four_cells|
                if four_cells.all? { |cell| cell.value == value }
                    true 
                else 
                    false 
                end
            end 
        end
    end

    def diagonal_win?(board, value)
        rows = board.length
        columns = board[0].length
        # Check diagonals from bottom-left to top-right
        (rows - 3).times do |i|
            (columns - 3).times do |j|
                if (0..3).all? { |k| board[i + k][j + k].value == value }
                    true 
                else 
                    false 
                end
            end 
        end
        # Check diagonals from top-left to bottom-right
        (rows - 3).times do |i|
            (columns - 3).times do |j|
                if (0..3).all? { |k| board[rows - 1 - i - k][j + k].value == value }
                    true 
                else 
                    false 
                end
            end 
        end
    end 
end