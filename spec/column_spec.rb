require "./spec/spec_helper.rb"

RSpec.describe Column do
    before :each do
        @column = Column.new
    end

    it "exists" do
        expect(@column).to be_an_instance_of Column
    end

    it "#empty?" do
        expect(@column.column_empty?).to be true
    end

    it "#column_option?" do
        expect(@column.column_option?("A")).to be true
        expect(@column.column_option?("X")).to be false
    end
end