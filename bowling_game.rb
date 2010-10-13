class BowlingGame
  
  def initialize
    @rolls = []
  end
  
  def roll(pins)
    @rolls << pins
  end
  
  def score
    score = 0
    frame_index = 0
    10.times do |frame|
      if is_spare?(frame_index)
        score += 10 + @rolls[frame_index + 2]
        frame_index += 2
      else
        score += @rolls[frame_index] + @rolls[frame_index + 1]
        frame_index += 2
      end
    end
    return score
  end
  
  def is_spare?(frame_index)
    return @rolls[frame_index] + @rolls[frame_index + 1] == 10
  end
  
end