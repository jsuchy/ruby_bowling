class BowlingGame
  
  def initialize
    @score = 0
  end
  
  def roll(pins)
    @score += pins
  end
  
  def score
    return @score
  end
  
end