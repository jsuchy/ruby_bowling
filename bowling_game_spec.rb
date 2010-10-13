$: << File.expand_path(File.dirname(__FILE__))
require 'bowling_game'

describe BowlingGame do

  it "scores an all gutter game" do
    @game = BowlingGame.new
    
    20.times do
      @game.roll(0)
    end
    
    @game.score.should == 0
  end  

end
