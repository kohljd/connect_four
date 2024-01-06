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

    def column_full?
        
    end

    def valid_column?(current_player_input)
        if current_player_input == ("A".."G")
            #update board
        else
            print "Invalid column name"
            take_turn
        end
    end

    def game_over?
        puts "game_over?"
        #check for winning/tie condition
        #if false 
            #change_player
            #take_turn
    end
end