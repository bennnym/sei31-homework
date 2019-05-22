class SecretNumberController < ApplicationController
  def index
  end

  def guess
    @guessed_number = params[:guessed_number].to_i
    @secret_number = rand(1..10)

    if @guessed_number == @secret_number
      @message = "You won!"
    else
      @message = "You lose! Try again!"
    end

    render :index
  end
end