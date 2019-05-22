class RockController < ApplicationController

def game
  render :game
end

def result
  @throw = params[:throw].upcase
  play = ["ROCK", "PAPER", "SCISSORS"]
  @match = play.sample
  if @match == @throw
    @result = "No Winner"
  elsif @match == "ROCK" && @throw == "PAPER"
    @result = "Human Wins"
  elsif @match == "ROCK" && @throw == "SCISSORS"
    @result = "Computer Wins"
  elsif @match == "PAPER" && @throw == "ROCK"
    @result = "Computer Wins"
  elsif @match == "PAPER" && @throw == "SCISSORS"
    @result = "Human Wins"
  elsif @match == "SCISSORS" && @throw == "ROCK"
    @result = "Human Wins"
  elsif @match == "SCISSORS" && @throw == "PAPER"
    @result = "Computer Wins"
  end
  render :result
end

end
