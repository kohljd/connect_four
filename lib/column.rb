class Column
    attr_accessor :cells, :column_letter

    def initialize
        @cells = Array.new(6) {Cell.new}
        @column_letter = nil
    end

end

    # def add_token(token)
        # code for gameplay to add tokens to columns
    # end
