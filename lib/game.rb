class Game

  attr_accessor :num_players, :players

  def initialize player_count
    @num_players = player_count.to_i
    @players = []
  end

  def add_player name
    if @players.index(name)==nil && @players.length < @num_players
      @players << name
      true
    else
      false
    end
  end

  def can_procede 
    if @players.length == @num_players
      true
    else
      false
    end
  end

  def shuffle_turn
    @players.shuffle!
  end

end