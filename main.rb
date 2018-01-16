require_relative "player"
require_relative "question"
require_relative "game"

player1 = Players.new("Bob")
player2 = Players.new("Monica")

game = Game.new([player1, player2])

while (player1.lives > 0 && player2.lives > 0)
  game.players.each do |player|
    question = Questions.new(game.current)
    result = gets.chomp.to_i
    question.verify_answer(game.current, result)
    if game.current.lives == 0
      break
    end
    game.end_turn
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    puts "----- NEW TURN -----"

  end
end

puts "----- GAME OVER -----"
puts "#{game.winner(game.players)[0]} wins with a score of #{game.winner(game.players)[1]}/3."
puts "GOODBYE!"