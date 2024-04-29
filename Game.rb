class Game
  attr_accessor :answer, :current_player, :p1, :p2
  attr_reader :players

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @players = {
      @p1 => "Player 1",
      @p2 => "Player 2"
    }
    self.current_player = @players[p1]
  end

  def question
    num1 = rand(1..10)
    num2 = rand(1..20)
    self.answer = num1 + num2
    "What does #{num1} plus #{num2} equal?"
  end

  def answer_correct?(ans)
    ans == answer
  end

  def print_scores
    print "#{players.key("Player 1").name}: #{players.key("Player 1").current_lives}/#{players.key("Player 1").start_lives} vs "
    puts "#{players.key("Player 2").name}: #{players.key("Player 2").current_lives}/#{players.key("Player 2").start_lives}"
  end

  def new_turn
    self.current_player = current_player == 'Player 1' ? players[p2] : players[p1]
    puts "#{'-'*5} NEW TURN #{'-'*5}"
  end

  def end_game
    print_scores
    puts "#{'-'*5} GAME OVER #{'-'*5}"
    winner = p1.current_lives == 0 ? p2 : p1
    puts "#{players[winner]} wins with a score of #{winner.current_lives}/#{winner.start_lives}"
  end

end