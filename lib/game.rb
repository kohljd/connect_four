class Game
    attr_reader :board,
                :player
    
    def initialize
        @board = Board.new
        @player_1 = Player.new("person", "X")
        @player_2 = Player.new("computer", "O")
        @current_player = @player_1
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
        valid_column?(current_player_input)
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
        column_number = current_player_input.ord - "A".ord
        columned_board = @board.board.transpose
        if columned_board[column_number].include?(".")
            place_token(current_player_input)
        else
            print "Column full"
            take_turn
        end
        take_turn
    end

    def place_token(current_player_input)
        column_number = current_player_input.ord - "A".ord
        columned_board = @board.board.transpose
        last_empty_cell_position = columned_board[column_number].rindex(".")
        columned_board[column_number][last_empty_cell_position] = @current_player.token
        @board = columned_board.transpose
        @board.display_board
        game_over?
    end

    def game_over?
        if tie_game? || horizontal_win? || vertical_win? || diagonal_win?
            #go to end game method that declares winner and asks if play again?
        else
            change_player
        end
    end

    def tie_game?
        @board.board.each do |row|
            return false if row.any? {|cell| cell == "."}
        end
        true
    end

    def horizontal_win?
        @board.board.each do |row|
            row.each_cons(4) do |tokens|
                return true if tokens.all? do |token|
                    token == "X" || "O"
                end
            end
            false
        end
    end

    def vertical_win?
        @board.board.transpose.each do |column|
            column.each_cons(4) do |tokens|
                return true if tokens.all? do |token|
                    token == "X" || "O"
                end
            end
            false
        end
    end

    def diagonal_win?
        return true if top_left_to_bottom_right || top_right_to_bottom_left
        false
    end

    def top_left_to_bottom_right
        return true if (0..3).all? {|num| @board.board[0 + num][0 + num] == "X" || "O" }
        false
    end

    def top_right_to_bottom_left
        return true if (0..3).all? {|num| @board.board[0 + num][7 - num] == "X" || "O" }
        false
    end

    def change_player
        if @current_player == @player_1
            @current_player = @player_2
            take_turn
        else
            @current_player = @player_1
            take_turn
        end
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
end