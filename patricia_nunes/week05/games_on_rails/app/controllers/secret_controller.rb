class SecretController < ApplicationController
  def guess
    render :guess
  end

  def true_or_false
    @guess = params[:number]
    @guess = @guess.to_i
    @secret_number = rand(1..10)

    if @guess == @secret_number
      @result = "true"
    else
      @result = "false"
    end

    render :true_or_false
  end
end
