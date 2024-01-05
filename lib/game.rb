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
        #welcome message
        #menu options
    end

    def start_game
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