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

            # it "alternates between player and computer" do
            #     expect(@game.current_player.player_name).to eq(@game.player_1.player_name)

            #     @game.change_player
            #     # allow(@game).to receive(:gets).and_return("A\n")
                
            #     expect(@game.current_player.player_name).to eq(@game.player_2.player_name)
            #     allow(@game).to receive(:gets).and_return("NO\n")
                
            #     expect(@game).to receive(:gets).and_return("NO\n")
                
            #     @game.take_turn
            # end

            # tests passes but stops remaining tests to run if not skipped
            xit "updates the board" do
                updated_board = Board.new            
                updated_board_array = [
                    ['X', '.', '.', '.', '.', '.', '.'],
                    ['X', 'X', '.', '.', '.', '.', '.'],
                    ['.', '.', 'X', '.', '.', '.', '.'],
                    ['.', '.', '.', 'X', '.', '.', '.'],
                    ['.', '.', '.', '.', '.', '.', '.'],
                    ['.', '.', '.', '.', '.', '.', '.'],
                    ['.', '.', '.', '.', '.', '.', '.']
                ]
                updated_board.instance_variable_set(:@board, updated_board_array)
                
                allow(@game).to receive(:gets).and_return("NO\n")
                expect(@game.place_token(@current_player_input)).to eq(updated_board.board)
            end
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
                allow(@game).to receive(:column_full?)
                current_player_input = "A"

                expect(@game).to receive(:column_full?).with(current_player_input)

                @game.valid_column?(current_player_input)
            end

            describe "#column_full?" do
                before :each do
                    @game = Game.new
                    @board = Board.new
                    @full_board_game = Game.new 
                    @full_board = Board.new 
                    @full_board_array = [
                        ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                        ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                        ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                        ['O', 'X', 'X', 'O', 'O', 'X', 'X'],
                        ['O', 'O', 'X', 'X', 'X', 'O', 'O'],
                        ['O', 'O', 'X', 'O', 'X', 'O', 'O'],
                        ['X', 'X', 'O', 'X', 'O', 'O', 'X']
                    ]                  
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
                    @game.instance_variable_set(:@board, @board)
                    @full_board.instance_variable_set(:@board, @full_board_array)
                    @full_board_game.instance_variable_set(:@board, @full_board)
                end

                # tests passes but stops remaining tests to run if not skipped
                xit "column_full? functions" do
                    allow(@full_game).to receive(:column_full?)
                    current_player_input = "A"
                    allow(@game).to receive(:gets).and_return("NO\n")

                    expect(@game).to receive(:take_turn).with(current_player_input)
                    @game.column_full?(current_player_input)
                end
            end
        end
    end    

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
            tie_board = Board.new
            tie_board_array = [
                ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
                ['O', 'X', 'X', 'O', 'O', 'X', 'X'],
                ['O', 'O', 'X', 'X', 'X', 'O', 'O'],
                ['O', 'O', 'X', 'O', 'X', 'O', 'O'],
                ['X', 'X', 'O', 'X', 'O', 'O', 'X']
            ]
            tie_board.instance_variable_set(:@board, tie_board_array)
            
            @game.instance_variable_set(:@board, tie_board)
            expect(@game.tie_game?).to be true
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
