$: << File.expand_path(File.dirname(__FILE__))
require 'bowling_game'

describe BowlingGame do

  before(:each) do
    @game = BowlingGame.new
  end
  
  def roll_many(number, pins)
    number.times do
      @game.roll(pins)
    end
  end
  
  it "scores an all gutter game" do
    roll_many(20, 0)
    
    @game.score.should == 0
  end
  
  it "scores a game with all 1s" do
    roll_many(20, 1)
    
    @game.score.should == 20
  end
  
  it "scores one spare" do
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    roll_many(17, 0)
    
    @game.score.should == 16
  end
  
  it "scores one strike" do
    @game.roll(10)
    @game.roll(3)
    @game.roll(4)
    roll_many(16, 0)
    
    @game.score.should == 24
  end
  
end
