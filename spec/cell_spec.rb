require "./spec/spec_helper.rb"

RSpec.describe Cell do
    before :each do
        cell = Cell.new
    end

    it "exists" do
        expect(cell).to be_an_instance_of Cell
    end
end