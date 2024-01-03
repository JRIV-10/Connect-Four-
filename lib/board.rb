class Board

    def self.cells
        board = Hash.new([])
        keys = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
        keys.map do |key|
            values = []
            index = 1
            6.times do 
                values << Cell.new(key , index)
                index += 1
            end
            board[key] = values
        end
        board
    end
end