require "./spec/spec_helper.rb"

RSpec.describe Column do
    before :each do
        @column = Column.new
    end

    it "exists" do
        expect(@column).to be_an_instance_of Column
    end
end