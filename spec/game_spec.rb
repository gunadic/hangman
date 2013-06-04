require 'pry'

require_relative '../lib/game'

describe Game do
  
  it "lets us set the number of players" do
    temp = Game.new(4)
    expect(temp.num_players).to eql(4)
  end

  it "has a method that adds a player to the game" do
    temp = Game.new(4)
    temp.add_player("sam")
    expect(temp.players.first).to eql("sam")
  end

  it "will not allow a player with a taken name to be added" do
    temp = Game.new(4)
    temp.add_player("sam")
    expect(temp.add_player("sam")).to eql(false)
  end

  it "has a method to check if all players have names" do
    temp = Game.new(4)
    temp.add_player("bill")
    temp.add_player("bill2")
    temp.add_player("bill3")
    expect(temp.can_procede).to eql(false)
  end

  it "does not allow you to add more players than specified" do
    temp = Game.new(4)
    temp.add_player("bill")
    temp.add_player("bill2")
    temp.add_player("bill3")
    temp.add_player("bill4")
    expect(temp.add_player("bill5")).to eql(false)

  end

  it "has a method that randomizes turn order" do
    temp = Game.new(4)
    temp.add_player("bill")
    temp.add_player("bill2")
    temp.add_player("bill3")
    temp.add_player("bill4")
    expect(temp).to respond_to(:shuffle_turn)
  end

end