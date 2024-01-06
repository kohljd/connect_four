require "./spec/spec_helper"

RSpec.describe Player do
    before :each do
        @player = Player.new("Computer", "O")
    end

    it "creates a player object" do        
        expect(@player).to be_an_instance_of(Player)
    end

    it "has name and token" do   
        expect(@player.player_name).to eq("Computer")
        expect(@player.token).to eq("O")
    end
end