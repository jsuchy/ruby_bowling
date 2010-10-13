class BowlingGame
  
  def initialize
    @rolls = []
  end
  
  def roll(pins)
    @rolls.push(pins)
  end
  
  def score
    score = 0
    @frame_index = 0
    10.times do |frame|
      if is_strike?
        score += 10 + strike_bonus
        @frame_index += 1
      elsif is_spare?
        score += 10 + spare_bonus
        @frame_index += 2
      else
        score += score_for_frame
        @frame_index += 2
      end
    end
    return score
  end
  
  def is_strike?
    pins_for(@frame_index) == 10
  end
  
  def is_spare?
    pins_for(@frame_index) + pins_for(@frame_index + 1) == 10
  end
  
  def pins_for(frame_index)
    @rolls[frame_index] || 0
  end
  
  def score_for_frame
    pins_for(@frame_index) + pins_for(@frame_index + 1)
  end
  
  def strike_bonus
    pins_for(@frame_index + 1) + pins_for(@frame_index + 2)
  end
  
  def spare_bonus
    pins_for(@frame_index + 2)
  end
  
end