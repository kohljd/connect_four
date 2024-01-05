class Column
    attr_accessor :cells, :column_name

    def initialize(column_name)
        @cells = Array.new(7) {Cell.new}
        @column_name = column_name
    end

end