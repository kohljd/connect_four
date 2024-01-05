class Column
    attr_accessor :cells, :column_letter

    def initialize
        @cells = Array.new(6) {Cell.new}
    end

    def column_empty?
        @cells.any? { |cell| cell.cell_empty? }
    end

end