class Board
    def initialize
        create_board
    end

    # create a board as an array containing seven instances of Column class
    def create_board
        @board = Array.new(7) {Column.new}
        @board[0].column_letter = "A"
        @board[1].column_letter = "B"
        @board[2].column_letter = "C"
        @board[3].column_letter = "D"
        @board[4].column_letter = "E"
        @board[5].column_letter = "F"
        @board[6].column_letter = "G"
        display_board
    end

    # puts column letters, iterates through board to map individual rows, puts rows
    def display_board
        puts "A B C D E F G"
        (0..5).each do |row|
            current_row = @board.map {|column| column.cells[row].token || column.cells[row].cell}.join("\n")
            puts current_row
        end
    end

    # verify correct count of columns; can be deleted if unnecessary, used for testing purposes
    def count_columns
        @board.size
    end
end
