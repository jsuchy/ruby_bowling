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
      if is_strike?(frame_index)
        score += 10 + pins_for(frame_index + 1) + pins_for(frame_index + 2)
        frame_index += 1
      elsif is_spare?(frame_index)
        score += 10 + @rolls[frame_index + 2]
        frame_index += 2
      else
        score += pins_for(frame_index) + pins_for(frame_index + 1)
        frame_index += 2
      end
    end
    return score
  end
  
  def is_strike?(frame_index)
    pins_for(frame_index) == 10
  end
  
  def is_spare?(frame_index)
    pins_for(frame_index) + pins_for(frame_index + 1) == 10
  end
  
  def pins_for(frame_index)
    @rolls[frame_index] || 0
  end
  
end