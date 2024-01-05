class Column
    attr_accessor :cells, :column_letter

    def initialize
        @cells = Array.new(6) {Cell.new}
    end

    def column_empty?
        if @cells.include?(".") == true
        end
    end

end