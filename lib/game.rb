class Game
    attr_reader :board,
                :player
    
    def initialize
        @board = Board.new
        @player_1 = Player.new("person", "X")
        @player_2 = Player.new("computer", "O")
        game_menu
    end

    def game_menu
        puts """\n\n#{"=" * 15} Welcome to Connect Four! #{"=" * 15}\n
        Type \"play\" to begin or \"quit\" to exit\n\n\n"""

        loop do
            case gets.strip.downcase
            when "play"
                start_game
                break
            when "quit"
                exit
            else
                puts "Invalid input: Please type \"play\" to begin game or \"quit\" to exit\n\n"
            end
        end
    end

    def start_game
        
        puts """\nHow to Play: Opponents take turns dropping their token (\"X\" or \"O\") into one of the columnns A-G. The first player to connect 4 of their tokens in a horizontal, vertical, or diagonal line wins! \n
        #{@player_1.player_name} is X's
        #{@player_2.player_name} is O's\n\n"""

        @board.create_board
        @board.display_board
        take_turn
    end

    def take_turn
        print "Type column name (A-G) to place token: "
        current_player_input = gets.strip.upcase
        valid_move?(current_player_input)
        #update board
        #display board
        #check if game over
    end

    def valid_move?(current_player_input)
        puts "valid_move?"
        #column full
            #display message
            #ask for new input
        #no such column
            #display message
            #ask for new input
    end

    def valid_column?(current_player_input)
        if current_player_input == ("A".."G")
            column_full?(current_player_input)
        else
            print "Invalid column name"
            take_turn
        end
    end

    def column_full?(current_player_input)
        column_number = current_player_input.upcase.ord - "A".ord 
        #takes A-G and subtracts ASCII value (65) from the player input, so 65-65 = 0 which is A, 65-64 = 1 which is B, etc.
        columned_board = @board.board.transpose
        if columned_board[column_number].include?(".")
            true
        else
            false
            print "Column full"
        end
        @board = columned_board.transpose
    end


=begin
board[row][column]
A -> board[0]
B -> board[1]
C -> board[2]
D -> board[3]
E -> board[4]
F -> board[5]
G -> board[6]

board[3][0] - "A"

board.board.transpose
board[0][3] - "A"
=end

    def game_over?
        puts "game_over?"
        #check for winning/tie condition
        #if false 
            #change_player
            #take_turn
    end

    def tie_game?
        @board.board.each do |row|
            return false if row.any? {|cell| cell == "."}
        end
        true
    end



end