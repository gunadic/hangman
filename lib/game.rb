class Game

  attr_accessor :num_players, :players

  def initialize player_count
    @num_players = player_count
    @players = []
  end

end