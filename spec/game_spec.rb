require "./spec/spec_helper"

RSpec.describe Game do
    describe "#game_menu" do
      it "starts the game when user inputs 'play'" do
        allow_any_instance_of(Object).to receive(:gets).and_return("play\n")
  
        game = Game.new
        expect(game).to receive(:start_game)
  
        game.game_menu
      end
    end
  end

# RSpec.describe Game do
#     before(:each) do
#         @game = Game.new
#         @board_1 = [
#             ['X', '.', '.', '.', '.', '.', '.'],
#             ['.', 'X', '.', '.', '.', '.', '.'],
#             ['.', '.', 'X', '.', '.', '.', '.'],
#             ['.', '.', '.', 'X', '.', '.', '.'],
#             ['.', '.', '.', '.', '.', '.', '.'],
#             ['.', '.', '.', '.', '.', '.', '.'],
#             ['.', '.', '.', '.', '.', '.', '.']
#         ]
#     end

#     it "creates a game object" do
#         expect(@game).to be_an_instance_of(Game)
#     end

#     it "starts the game when user inputs 'play'" do
#         allow_any_instance_of(Object).to receive(:gets).and_return("play\n")
  
#         game = Game.new
#         expect(game).to receive(:start_game)
  
#         game.game_menu
#         # allow(@game).to receive(:gets).and_return("sdkfjkdj\n")
#         # expect(@game.game_menu).to include("Invalid input:")
#         # # @game.game_menu("play\n")

#         # expect(@game).to receive(:start_game)
#     end

#     describe "beginning" do
#         it "game menu accepts user input" do
#             allow(@game).to receive(:gets).and_return("play\n")
#             expect(@game).to receive(:start_game)
#             @game.game_menu
#         end
#     end

#     describe "turn" do
#         before :each do
#             @current_player_input = "A"
#             @player_1 = @game.player_1
#             @player_2 = @game.player_2
#         end

#         it "alternates between player and computer" do
#             expect(@game.current_player).to eq(@player_1)

#             @game.change_player

#             expect(@game.current_player).to eq(@player_2)
#         end

#         it "updates the board" do
#             # starting with a board of empty cells
#             updated_board = [
#                 ['X', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.']
#             ]

#             expect(place_token(@current_player_input)).to eq(updated_board)
#         end
#     end

#     describe "for player" do
#         describe "validates turn input" do
#             it "#valid_column?" do
#                 # setup of #column_full?, may not need the next line
#                 allow(@game).to receive(:column_full?)
#                 @game.valid_column?("A")

#                 expect(@game.valid_column?("A")).to have_received(:column_full?)

#                 @game.valid_column?("H")
#                 expect(@game.valid_column?("H")).to output(/Invalid column name:/).to_stdout
#             end

#             describe "#column_full?" do
#                 before :each do
#                     @full_board = [
#                         ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
#                         ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
#                         ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
#                         ['O', 'X', 'X', 'O', 'O', 'X', 'X'],
#                         ['O', 'O', 'X', 'X', 'X', 'O', 'O'],
#                         ['O', 'O', 'X', 'O', 'X', 'O', 'O'],
#                         ['X', 'X', 'O', 'X', 'O', 'O', 'X']
#                     ]
#                     @full_board_game = Game.new
#                     @game.instance_variable_set(:@board, @board_1)
#                     @full_board_game.instance_variable_set(:@board, @full_board)
#                 end

#                 it "if the column is not full" do
#                     expect(@game.column_full?("A")).to have_received(:place_token)

#                     # valid entry
#                     expect(@game.valid_column?).to be true
#                 end

#                 it "if the column is full" do
#                     # invalid entry with an error message displayed
#                     expect(@game.valid_column?).to be false
#                 end
#             end
#         end
#     end

#     describe "for computer" do
#         it "plays a token in a random column" do
#             # take_turn
#         end

#         describe "checks input validity" do
#             it "if a valid column option" do
#                 # valid entry
#                 expect(@game.valid_move?).to be true

#                 # invalid entry with an error message displayed
#                 expect(@game.valid_move?).to be false
#             end

#             it "if the column is full" do
#                 # valid entry
#                 expect(@game.valid_move?).to be true

#                 # invalid entry with an error message displayed
#                 expect(@game.valid_move?).to be false
#             end
#         end
#     end

#     describe "ending" do
#         it "checks vertical win" do
#             winning_board = [
#                 ['X', '.', '.', '.', '.', '.', '.'],
#                 ['X', '.', '.', '.', '.', '.', '.'],
#                 ['X', '.', '.', '.', '.', '.', '.'],
#                 ['X', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.']
#             ]
#             losing_game = Game.new
#             @game.instance_variable_set(:@board, winning_board)
#             losing_game.instance_variable_set(:@board, @board_1)

#             expect(@game.vertical_win?).to be true
#             expect(@game.vertical_win?).to be false
#         end

#         it "checks for horizontal win" do
#             winning_board = [
#                 ['X', 'X', 'X', 'X', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],               
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.']
#             ]
#             losing_game = Game.new
#             @game.instance_variable_set(:@board, winning_board)
#             losing_game.instance_variable_set(:@board, @board_1)

#             expect(@game.horizontal_win?).to be true
#             expect(losing_game.horizontal_win?).to be false
#         end

#         it "checks for diagonal win" do
#             winning_board = [
#                 ['.', '.', '.', '.', '.', '.', 'X'],
#                 ['.', '.', '.', '.', '.', 'X', '.'],
#                 ['.', '.', '.', '.', 'X', '.', '.'],
#                 ['.', '.', '.', 'X', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.']
#             ]
#             losing_board = [
#                 ['X', '.', '.', '.', '.', '.', '.'],
#                 ['X', '.', '.', '.', '.', '.', '.'],
#                 ['X', '.', '.', '.', '.', '.', '.'],
#                 ['X', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.'],
#                 ['.', '.', '.', '.', '.', '.', '.']
#             ]
#             game_1 = Game.new
#             losing_game = Game.new
#             @game.instance_variable_set(:@board, @board_1)
#             game_1.instance_variable_set(:@board, winning_board)
#             losing_game.instance_variable_set(:@board, losing_board)

#             # top-left to bottom-right
#             expect(@game.diagonal_win?).to be true
#             # top-right to bottom-left
#             expect(game_1.diagonal_win?).to be true
#             expect(losing_game.diagonal_win?).to be false
#         end

#         it "checks for a tie" do
#             tie_board = [
#                 ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
#                 ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
#                 ['X', 'O', 'O', 'X', 'X', 'O', 'O'],
#                 ['O', 'X', 'X', 'O', 'O', 'X', 'X'],
#                 ['O', 'O', 'X', 'X', 'X', 'O', 'O'],
#                 ['O', 'O', 'X', 'O', 'X', 'O', 'O'],
#                 ['X', 'X', 'O', 'X', 'O', 'O', 'X']
#             ]
#             not_a_tie_game = Game.new
#             @game.instance_variable_set(:@board, tie_board)
#             not_a_tie_game.instance_variable_set(:@board, @board_1)

#             expect(@game.tie_game?).to be true
#             expect(not_a_tie_game.tie_game?).to be false
#         end

#         it "checks for wins with consecutive tokens" do
#             # code, use @board_1
#         end

#         it "displays the end game message" do
#             # code
#         end

#         it "does not allow additional turns" do
#             # end_game/#play_again combo or delete this one
#         end

#         it "returns the user to the game menu" do
#             # play_again
#         end
#     end
# end
