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
      if @rolls[frame_index] + @rolls[frame_index + 1] == 10
        score += 10 + @rolls[frame_index + 2]
        frame_index += 2
      else
        score += @rolls[frame_index] + @rolls[frame_index + 1]
        frame_index += 2
      end
    end
    return score
  end
  
end