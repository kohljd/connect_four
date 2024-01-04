require "matrix"

class Board
    def initialize
        create_board
    end

    def create_board
        board = Array.new(7) {Array.new(7, ".")}
        board[0] = ["A", "B", "C", "D", "E", "F", "G"]
        board.each {|row| print "#{row.join} \n"}
    end
endf