require "./spec/spec_helper"

RSpec.describe Game do
    before(:each) do
        #code to create Game object
    end
    
    it "creates a game object" do
        expect(game).to be_an_instance_of(Game)
    end

    describe "turn" do
        it "alternates between player and computer" do
            #code
        end

        it "updates board" do
            #code
        end
        
        describe "for player" do
            describe "checks input validity" do
                it "if valid column option" do
                    #display error message
                end
    
                it "if column is full" do
                    #display error message
                end
            end
        end

        describe "for computer" do
            it "plays token in random column" do
                #code
            end

            describe "checks input validity" do
                it "if valid column option" do
                    #display error message
                end
    
                it "if column is full" do
                    #display error message
                end
            end
        end
    end

    describe "ending" do
        it "checks vertical win" do
            #code
        end

        it "checks for horizonatl win" do
            #code
        end

        it "checks for diagonal win" do
            #code
        end

        it "checks for tie" do
            #code
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