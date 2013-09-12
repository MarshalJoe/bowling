class BowlingGame
  attr_accessor :rolls

  def initialize
    @rolls = []
    @total_score = 0
    @current_roll = 0
  end

  # Record a roll in the game.
  #
  # pins - the Integer number of pins knocked down in this roll.
  #
  # Returns nothing.
  def roll(pins)
    @rolls.push(pins)
  end

  # Returns the Integer score for this game. Expects to be run after all rolls
  # for the game have been recorded.
  def score

    while @current_roll < @rolls.size - 1
      init_roll

      if strike? 
        score_strike
      elsif spare?
        score_spare
      else
        norm_roll
      end

    end

    return @total_score
  end

  private 
  # initialize values for roll and next_roll
  # 
  # returns nothing
  def init_roll
    @roll = @rolls[@current_roll]
    @next_roll = @rolls[@current_roll + 1]
  end

  #returns true if the roll was a strike, otherwise returns false
  def strike?
    @roll == 10
  end

  #returns true if the roll was a spare (all pins knocked down in two rolls, otherwise false)
  def spare?
    @roll + @next_roll == 10
  end

  #scores a strike frame and adds it to the total score for the game
  #
  #returns nothing
  def score_strike
    @total_score += 10 + @next_roll + @rolls[@current_roll + 2]
    @current_roll += 1
  end

  #scores a spare frame and adds it to the total score for the game
  #
  #returns nothing
  def score_spare
    @total_score += 10 + @rolls[@current_roll +2]
    @current_roll += 2
  end

  def norm_roll
    @total_score +=@roll + @next_roll
    @current_roll +=2
  end

end

  




