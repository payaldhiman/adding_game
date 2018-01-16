require_relative "player"

class Game
  attr_reader :players, :current
  def initialize(players)
    @players = players
    @current = players[0]
  end

  def end_turn
    current_idx = @players.index(@current)
    new_idx = (current_idx + 1) % players.length
    if new_idx == 0
      return
    end
    @current = @players[new_idx]
  end

  def winner(players)
    winner = players.sort_by{ |player| player.lives } [-1]
    return [winner.name, winner.lives]
  end

end