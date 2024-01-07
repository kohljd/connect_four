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
        @game.instance_variable_set(:@board, @board_1)
    end

    it "creates a game object" do
        expect(@game).to be_an_instance_of(Game)
    end

    it "starts the game when user inputs 'play'" do
        allow(@game).to receive(:gets).and_return("play\n")
        expect(@game).to receive(:start_game)
  
        @game.game_menu
    end

    # describe "beginning" do
    #     it "game menu accepts user input" do
    #         allow(@game).to receive(:gets).and_return("play\n")
    #         expect(@game).to receive(:start_game)
    #         @@game.game_menu
    #     end
    # end

    describe "turn" do
        before :each do
            @current_player_input = "A"
            @game = Game.new
            @board = Board.new
            @board_array = [
                ['X', '.', '.', '.', '.', '.', '.'],
                ['.', 'X', '.', '.', '.', '.', '.'],
                ['.', '.', 'X', '.', '.', '.', '.'],
                ['.', '.', '.', 'X', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            @game.instance_variable_set(:@board, @board)
            @board.instance_variable_set(:@board, @board_array)
            

        end

            it "alternates between player and computer" do
                expect(@game.current_player.player_name).to eq(@game.player_1.player_name)

                @game.change_player

                expect(@game.current_player.player_name).to eq(@game.player_2.player_name)
                allow(@game).to receive(:gets).and_return("NO\n")

                @game.take_turn
            end

            # it "updates the board" do
                

            #     updated_board = Board.new            
            #     updated_board_array = [
            #         ['X', '.', '.', '.', '.', '.', '.'],
            #         ['X', 'X', '.', '.', '.', '.', '.'],
            #         ['.', '.', 'X', '.', '.', '.', '.'],
            #         ['.', '.', '.', 'X', '.', '.', '.'],
            #         ['.', '.', '.', '.', '.', '.', '.'],
            #         ['.', '.', '.', '.', '.', '.', '.'],
            #         ['.', '.', '.', '.', '.', '.', '.']
            #     ]
            #     updated_board.instance_variable_set(:@board, updated_board_array)
                
            #     expect(@game.place_token(@current_player_input)).to eq(updated_board.board)
            # end
    end

    describe "for player" do
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
            @board = Board.new
            @board_array = [
                ['X', '.', '.', '.', '.', '.', '.'],
                ['.', 'X', '.', '.', '.', '.', '.'],
                ['.', '.', 'X', '.', '.', '.', '.'],
                ['.', '.', '.', 'X', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            @game.instance_variable_set(:@board, @board_1)
            @board.instance_variable_set(:@board, @board_array)
        end
        
        describe "validates turn input" do
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
                @board = Board.new
                @board_array = [
                    ['X', '.', '.', '.', '.', '.', '.'],
                    ['.', 'X', '.', '.', '.', '.', '.'],
                    ['.', '.', 'X', '.', '.', '.', '.'],
                    ['.', '.', '.', 'X', '.', '.', '.'],
                    ['.', '.', '.', '.', '.', '.', '.'],
                    ['.', '.', '.', '.', '.', '.', '.'],
                    ['.', '.', '.', '.', '.', '.', '.']
                ]
                @board.instance_variable_set(:@board, @board_array)
                @game.instance_variable_set(:@board, @board_1)
            end

            it "#valid_column?" do
                # setup of #column_full?, may not need the next line
                allow(@game).to receive(:column_full?)

                expect(@game).to receive(:column_full?).with("A")

                # expect(@game.valid_column?("H")).to output(/Invalid column name:/).to_stdout
            end

            describe "#column_full?" do
                before :each do
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
                    @game.instance_variable_set(:@board, @board_1)
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
                    @board = Board.new
                    @board_array = [
                        ['X', '.', '.', '.', '.', '.', '.'],
                        ['.', 'X', '.', '.', '.', '.', '.'],
                        ['.', '.', 'X', '.', '.', '.', '.'],
                        ['.', '.', '.', 'X', '.', '.', '.'],
                        ['.', '.', '.', '.', '.', '.', '.'],
                        ['.', '.', '.', '.', '.', '.', '.'],
                        ['.', '.', '.', '.', '.', '.', '.']
                    ]
                    @board.instance_variable_set(:@board, @board_array)
                    @game.instance_variable_set(:@board, @board_1)
                    @full_board_game.instance_variable_set(:@board, @full_board)
                end

                it "if the column is not full" do
                    # expect(@game.column_full?("A")).to have_received(:place_token)

                    # valid entry
                    expect(@game.valid_column?).to receive(:take_turn).with("A")
                    game.column_full?("A")
                end

                # it "if the column is full" do
                #     # invalid entry with an error message displayed
                #     expect(@game.valid_column?).to be false
                # end
            end
        end
    end

    # describe "for computer" do
    #     it "plays a token in a random column" do
    #         # take_turn
    #     end

    #     describe "checks input validity" do
    #         it "if a valid column option" do
    #             # valid entry
    #             expect(@game.valid_move?).to be true

    #             # invalid entry with an error message displayed
    #             expect(@game.valid_move?).to be false
    #         end

    #         it "if the column is full" do
    #             # valid entry
    #             expect(@game.valid_move?).to be true

    #             # invalid entry with an error message displayed
    #             expect(@game.valid_move?).to be false
    #         end
    #     end
    # end

    

    describe "ending" do
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
            @board = Board.new
            @board_array = [
                ['X', '.', '.', '.', '.', '.', '.'],
                ['.', 'X', '.', '.', '.', '.', '.'],
                ['.', '.', 'X', '.', '.', '.', '.'],
                ['.', '.', '.', 'X', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            @board.instance_variable_set(:@board, @board_array)
            @game.instance_variable_set(:@board, @board_1)
        end

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

            # top-left to bottom-right
            expect(@game.diagonal_win?).to be true
            # top-right to bottom-left
            expect(game_1.diagonal_win?).to be true
            expect(losing_game.diagonal_win?).to be false
        end

        it "checks for a tie" do
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

        # it "checks for wins with consecutive tokens" do
        #     # code, use @board_1
        # end

        # it "displays the end game message" do
        #     # code
        # end

        # it "does not allow additional turns" do
        #     # end_game/#play_again combo or delete this one
        # end

        # it "returns the user to the game menu" do
        #     # play_again
        # end
    end
end
