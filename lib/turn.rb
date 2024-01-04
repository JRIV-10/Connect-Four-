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

    def display_board 
        @board.display
    end

    def get_user_input
        puts 'Enter a letter A-G to place your piece'
        input =  gets.chomp.upcase 
        validate_user_input(input)
    end

end