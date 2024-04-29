class Player

  attr_accessor :current_lives
  attr_reader :name, :start_lives

  def initialize(name, lives)
    @name = name
    @start_lives = self.current_lives = lives
  end

  def lose_life
    self.current_lives -= 1
  end

end