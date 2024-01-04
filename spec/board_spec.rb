require "./spec/spec_helper"

RSpec.describe Board do
    it "creates a board object" do
        board = Board.new
        expect(board).to be_an_instance_of(Board)
    end
end