class SecretController < ApplicationController

  def game
    render :game
  end

  def result
    @guess = params[:guess].to_i
    @random = rand 1..10
    if @guess >= 1 && @guess <=10
      if @guess == @random
      @result = 'Correct Guess. You Win!'
      else
      @result = 'Wrong Guess. You Lose!'
      end
      render :result
    else
      flash[:alert] = 'Guess the number within the range'
      render :game
    end
  end
end
