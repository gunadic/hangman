class Game

  attr_accessor :num_players, :players

  def initialize player_count
    @num_players = player_count.to_i
    @players = []
  end

  def add_player name
    if @players.index(name)==nil
      @players << name
      true
    else
      false
    end
  end

end