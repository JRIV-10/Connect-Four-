class Player 
    attr_reader :name,
                :value

    def initialize(value, name) 
        @name = name
        @value = value 
    end

    def get_user_name(name)
        puts 'Please enter your name'
        @name = gets.chomp
    end
end