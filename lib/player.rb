class Player 
    attr_reader :name

    def get_user_name
        puts 'Please enter your name'
        @name = gets.chomp
    end
end