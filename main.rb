require './Player'
require './Game'

player1 = Player.new("P1", 3)
player2 = Player.new("P2", 3)

game = Game.new(player1, player2)

loop do
  
  answer = game.ask_question

  if game.answer_correct?(answer) 
    game.handle_right
  else
    game.handle_wrong
  end

  unless game.continue?
    break
  end

  game.print_scores
  game.new_turn
 
end

game.end_game