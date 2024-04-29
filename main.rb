require './Player'
require './Game'

player1 = Player.new("P1", 3)
player2 = Player.new("P2", 3)

game = Game.new(player1, player2)

loop do
  print "#{game.current_player}: #{game.question}\n> "
  answer = $stdin.gets.chomp.to_i

  unless game.answer_correct?(answer) 
    puts "#{game.current_player}: Wrong answer! You lose a life, sorry."
    game.players.key(game.current_player).lose_life
  else
    puts "#{game.current_player}: Correct answer! You live to see another day!"
  end

  if game.players.key(game.current_player).current_lives == 0
    break
  end

  game.print_scores
  game.new_turn
 
end

game.end_game