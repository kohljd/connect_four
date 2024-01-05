class Column
    attr_accessor :cells, :column_name

    def initialize(column_name)
        @cells = Array.new(6) {Cell.new}
        @column_name = column_name
    end

    # def add_token(token)
        # code for gameplay to add tokens to columns
    # end

end