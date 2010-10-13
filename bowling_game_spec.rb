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
  
  def roll_strike
    @game.roll(10)
  end
  
  def roll_spare
    @game.roll(5)
    @game.roll(5)
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
    roll_spare
    @game.roll(3)
    roll_many(17, 0)
    
    @game.score.should == 16
  end
  
  it "scores one strike" do
    roll_strike
    @game.roll(3)
    @game.roll(4)
    roll_many(16, 0)
    
    @game.score.should == 24
  end
  
  it "scores Dutch game" do
    5.times do
      roll_strike
      roll_spare
    end
    roll_strike
    
    @game.score.should == 200
  end
  
end
