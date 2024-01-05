class Column
    attr_accessor :cells, :column_letter

    def initialize
        @cells = Array.new(6) {Cell.new}
    end

    def column_empty?
        @cells.any? { |cell| cell.cell_empty? }
    end

    #taking user input to see if the selected column is valid; turning "A"-"G" into an array and checking for correct elements
    def column_option?(input)
        valid_columns = ("A".."G").to_a
        valid_columns.include?(input)
    end

end