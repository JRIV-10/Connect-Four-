class Game

    attr_reader :game,
                :user_name,
                :computer_name

    def return_main_menu
        @game = StartGame.new
        @game.give_welcome
    end

    def create_players_turn
        @user_name = Player.new.get_user_name
        @computer_name = 'Computer'
        start_turns(@user_name)
    end
    
    def start_turn
        turn = Turn.new(board, player, computer)
    end
    
    #Game ends when user inputs q
    #
end