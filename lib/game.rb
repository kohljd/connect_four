class Game
    attr_reader :board,
                :players,
                :current_player
    
    def initialize
        @board = Board.new
        @players = #[player_1, computer]
        @current_player = #@players[0]
        game_menu
    end

    def game_menu
        puts """\n\n#{"=" * 15} Welcome to Connect Four! #{"=" * 15}\n
        Type \"play\" to begin or \"quit\" to exit\n\n\n"""

        loop do
            case gets.strip.downcase
            when "play"
                start_game
                #need `break` here to exit loop?
            when "quit"
                exit
            else
                puts "Invalid input: Please type \"play\" to begin game or \"quit\" to exit\n\n"
            end
        end
    end

    def start_game
        
        puts """How to Play: Opponents take turns dropping their token (\"X\" or \"O\") into one of the columnns A-G. The first player to connect 4 of their tokens in a horizontal, vertical, or diagonal line wins! \n
        Player_1 is X's \n
        Computer is O's\n\n"""
        @board.create_board
        take_turn
        #instructions
        #make/display board
        #start 1st turn
    end

    def take_turn
        #get player input
        #check if valid move
        #update board
        #display board
        #check if game over
    end

    def valid_move?(current_player_input)
        #column full
            #display message
            #ask for new input
        #no such column
            #display message
            #ask for new input
    end

    def game_over?
        #check for winning/tie condition
        #if false 
            #change_player
            #take_turn
    end
end