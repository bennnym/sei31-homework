class RpsController < ApplicationController
  def rock_paper_scissors
    render :rock_paper_scissor
  end

  def win_or_lose
    @computer = ['rock', 'paper', 'scissors']
    @computer = @computer.sample

    @move = params[:move]

    if @computer == @Move
      @result = 'draw'
    elsif @computer == 'rock' && @move == 'scissors' || @move == 'rock' && @computer == 'scissors'
      @result = 'rock win'
    elsif @computer == 'paper' && @move == 'rock' || @move == 'paper' && @computer == 'rock'
      @result = 'paper win'
    elsif @computer == 'scissors' && @move == 'paper' || @move == 'scissors' && @computer == 'paper'
      @result = 'scissors win'
    end

    render :play

  end
end
