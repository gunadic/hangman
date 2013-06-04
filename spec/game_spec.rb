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

end