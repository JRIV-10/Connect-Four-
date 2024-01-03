class Cell 
    attr_reader :column,
                :row, 
                :value

    def initialize(column, row)
        @column = column
        @row = row 
        @value = '.'
    end 

    def empty?
        @value == '.'
    end

    def assign_value(value)
        @value = value
    end
end 