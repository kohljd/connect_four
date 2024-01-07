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
    end
    
    it "creates a game object" do
        expect(@game).to be_an_instance_of(Game)
    end

    describe "beginning" do        
        it "game menu accepts user input" do
            # code
            #accepts user input and does the appropriate thing
        end
    end

    describe "turn" do
        it "alternates between player and computer" do
            #code
        end

        it "updates board" do
            #code
        end
        
        describe "for player" do
            describe "validates turn input" do
                it "if valid column option" do
                    #valid entry
                    expect(@game.valid_move?()).to be true
                    
                    #invalid entry with error message displayed
                    expect(@game.valid_move?()).to be false
                    expect(@game.valid_move?()).to be_a(String)
                end
    
                it "if column is full" do
                    #valid entry
                    expect(@game.valid_move?()).to be true
                    
                    #invalid entry with error message displayed
                    expect(@game.valid_move?()).to be false
                    expect(@game.valid_move?()).to be_a(String)
                end

                # write tests for valid_column? and column_full? methods
            end
        end

        describe "for computer" do
            it "plays token in random column" do
                #code
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
                ['', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            expect(@game.vertical_win?).to be true

            #diff manual board
            expect(@game.vertical_win?).to be false
        end

        it "checks for horizontal win" do
            winning_board = [
                ['X', 'X', 'X', 'X', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            expect(@game.horizontal_win?).to be true

            #diff manual board
            expect(@game.horizontal_win?).to be false
        end

        it "checks for diagonal win" do
            winning_board_1 = [
                ['X', '.', '.', '.', '.', '.', '.'],
                ['.', 'X', '.', '.', '.', '.', '.'],
                ['.', '.', 'X', '.', '.', '.', '.'],
                ['.', '.', '.', 'X', '.', '.', '.'],
                ['', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            winning_board_2 = [
                ['.', '.', '.', '.', '.', '.', 'X'],
                ['.', '.', '.', '.', '.', 'X', '.'],
                ['.', '.', '.', '.', 'X', '.', '.'],
                ['.', '.', '.', 'X', '.', '.', '.'],
                ['', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
            ]
            expect(@game.diagonal_win?).to be true

            #diff manual board
            expect(@game.diagonal_win?).to be false
        end

        it "checks for tie" do
            #create manual board
            expect(@game.tie_game?).to be true

            #diff manual board
            expect(@game.tie_game?).to be false
        end

        it "displays end game message" do
            #code
        end

        it "does not allow additional turns" do
            #code
        end

        it "returns user to game menu" do
            #code
        end
    end
end