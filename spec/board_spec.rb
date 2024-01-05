require "./spec/spec_helper"

RSpec.describe Board do
    before :each do
        @board = Board.new
    end

    it "creates a board object" do        
        expect(@board).to be_an_instance_of(Board)
    end
end