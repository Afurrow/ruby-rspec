# frozen_string_literal: true

# class for computer to find random number
class FindNumber
  attr_reader :answer
  attr_accessor :min, :max, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max), guess = nil)
    @min = min
    @max = max
    # The RandomNumber class will have an instance variable '@value'
    @answer = answer.value
    @guess = guess
  end

  def make_guess()
    ((self.min + self.max) / 2).floor()
  end 

  def game_over()
    self.guess == self.answer 
  end 

  def update_range()
    self.guess < self.answer ? self.min = self.guess + 1 : self.max = self.guess - 1
  end 
end