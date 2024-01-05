class Board
    def initialize
        create_board
    end

    # init @board as an array containing seven instances of Column class
    def create_board
        @board = Array.new(7) {Column.new}
        @board[0].column_label = "A"
        @board[1].column_label = "B"
        @board[2].column_label = "C"
        @board[3].column_label = "D"
        @board[4].column_label = "E"
        @board[5].column_label = "F"
        @board[6].column_label = "G"
        display_board
    end

    def display_board
        puts "A B C D E F G"
        @board.each {|row| puts "#{row[0..6].join} \n"}
    end
end
