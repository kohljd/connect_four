require "./spec/spec_helper"

RSpec.describe Game do
    before(:each) do
        @game = Game.new
        @board_1 = [
            ['X', '.', '.', '.', '.', '.', '.'],
            ['.', 'X', '.', '.', '.', '.', '.'],
            ['.', '.', 'X', '.', '.', '.', '.'],
            ['.', '.', '.', 'X', '.', '.', '.'],
            ['.', '.', '.', '.', '.', '.', '.'],
            ['.', '.', '.', '.', '.', '.', '.'],
            ['.', '.', '.', '.', '.', '.', '.']
        ]
        # allow(@game).to receive(:gets).and_return("play\n")
        # @game.game_menu("play\n")
    end

    it "starts the game when user inputs 'play'" do
        expect(@game).to receive(:start_game)
        expect { @game.game_menu }.to output(/Type "play" to begin or "quit" to exit/).to_stdout
    end
      

    it "creates a game object" do
        expect(@game).to be_an_instance_of(Game)
    end

    describe "beginning" do
        it "game menu accepts user input" do
            # checks to see that "play" will call #start_game
            expect(@game).to receive(:start_game)
        end
    end

    describe "turn" do
        before :each do
            @current_player_input = "A"
            @player_1 = @game.player_1
            @player_2 = @game.player_2 
        it "alternates between player and computer" do
            expect(@game.current_player).to eq(@player_1)

            @game.change_player

            expect(@game.current_player).to eq(@player_2)
        end

        it "updates board" do
            # starting with a board of empty cells
            updated_board =[
                ['X', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]

            expect(place_token(@current_player_input)).to eq(updated_board)
        end
        
        describe "for player" do
            describe "validates turn input" do
                it "#valid_column?" do
                    #setup of #column_full?, may not need next line
                    allow(@game).to receive(:column_full?)
                    @game.valid_column?("A")

                    expect {@game.valid_column?("A")}.to have_received(:column_full?)
                    
                    @game.valid_column?("H")
                    expect {@game.valid_column?("H")}.to output(/Invalid column name:/).to_stdout
                end 
    
            describe "#column_full?" do
                before :each do 
                    @full_board = [
                        ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                        ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                        ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                        ['O', 'X', 'X', 'O', 'O', 'X', 'X'],
                        ['O', 'O', 'X', 'X', 'X', 'O', 'O'],
                        ['O', 'O', 'X', 'O', 'X', 'O', 'O'],
                        ['X', 'X', 'O', 'X', 'O', 'O', 'X']
                    ]
                    @full_board_game = Game.new
                    @game.instance_variable_set(:@board, @board_1)
                    @full_board_game.instance_variable_set(:@board, @full_board)
                end
                    it "if column is full" do


                        #valid entry
                        expect(@game.valid_column?()).to be true
                        
                        #invalid entry with error message displayed
                        expect(@game.valid_column?()).to be false
                    end
                end
        end

        describe "for computer" do
            it "plays token in random column" do
                #take_turn
            end

            describe "checks input validity" do
                it "if valid column option" do
                    #valid entry
                    expect(@game.valid_move?()).to be true
                    
                    #invalid entry with error message displayed
                    expect(@game.valid_move?()).to be false
                end
    
                it "if column is full" do
                    #valid entry
                    expect(@game.valid_move?()).to be true
                    
                    #invalid entry with error message displayed
                    expect(@game.valid_move?()).to be false
                end
            end
        end
    end

    describe "ending" do
        it "checks vertical win" do
            winning_board = [
                ['X', '.', '.', '.', '.', '.', '.'],
                ['X', '.', '.', '.', '.', '.', '.'],
                ['X', '.', '.', '.', '.', '.', '.'],
                ['X', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            losing_game = Game.new
            @game.instance_variable_set(:@board, winning_board)
            losing_game.instance_variable_set(:@board, @board_1)

            expect(@game.vertical_win?).to be true
            expect(@game.vertical_win?).to be false
        end

        it "checks for horizontal win" do
            winning_board = [
                ['X', 'X', 'X', 'X', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            losing_game = Game.new
            @game.instance_variable_set(:@board, winning_board)
            losing_game.instance_variable_set(:@board, @board_1)

            expect(@game.horizontal_win?).to be true
            expect(losing_game.horizontal_win?).to be false
        end

        it "checks for diagonal win" do
            winning_board = [
                ['.', '.', '.', '.', '.', '.', 'X'],
                ['.', '.', '.', '.', '.', 'X', '.'],
                ['.', '.', '.', '.', 'X', '.', '.'],
                ['.', '.', '.', 'X', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            losing_board = [
                ['X', '.', '.', '.', '.', '.', '.'],
                ['X', '.', '.', '.', '.', '.', '.'],
                ['X', '.', '.', '.', '.', '.', '.'],
                ['X', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            game_1 = Game.new
            losing_game = Game.new
            @game.instance_variable_set(:@board, @board_1)
            game_1.instance_variable_set(:@board, winning_board)
            losing_game.instance_variable_set(:@board, losing_board)

            # top left to bottom right
            expect(@game.diagonal_win?).to be true
            # top right to bottom left
            expect(game_1.diagonal_win?).to be true
            expect(losing_game.diagonal_win?).to be false
        end

        it "checks for tie" do
            tie_board = [
                ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                ['O', 'X', 'X', 'O', 'O', 'X', 'X'],
                ['O', 'O', 'X', 'X', 'X', 'O', 'O'],
                ['O', 'O', 'X', 'O', 'X', 'O', 'O'],
                ['X', 'X', 'O', 'X', 'O', 'O', 'X']
            ]
            not_a_tie_game = Game.new
            @game.instance_variable_set(:@board, tie_board)
            not_a_tie_game.instance_variable_set(:@board, @board_1)

            expect(@game.tie_game?).to be true
            expect(not_a_tie_game.tie_game?).to be false
        end

        it "checks wins for consecutive tokens" do
            # code, use @board_1
        end

        it "displays end game message" do
            #code
        end

        it "does not allow additional turns" do
            #end_game/#play_again combo or delete this one
        end

        it "returns user to game menu" do
            #play_again
        end
    end
end
