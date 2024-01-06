require "./spec/spec_helper"

RSpec.describe Board do
    before :each do
        @board = Board.new
    end

    it "creates a board object" do        
        expect(@board).to be_an_instance_of(Board)
    end

    it "#count_columns" do
        expect(@board.count_columns).to eq 7
    end
end