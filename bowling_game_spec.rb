$: << File.expand_path(File.dirname(__FILE__))
require 'bowling_game'

describe BowlingGame do

  before(:each) do
    @game = BowlingGame.new
  end
  
  it "scores an all gutter game" do
    20.times do
      @game.roll(0)
    end
    
    @game.score.should == 0
  end
  
  it "scores a game with all 1s" do
    20.times do
      @game.roll(1)
    end
    
    @game.score.should == 20
  end  

end
