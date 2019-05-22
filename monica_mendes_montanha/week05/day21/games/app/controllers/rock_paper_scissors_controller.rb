class RockPaperScissorsController < ApplicationController
  def index
  end

  def throw
    @player_1 = params[:throw]
    @player_2 = computer

    @message = game_rules(@player_1, @player_2)
  end

  private

  def game_rules(player_1, player_2)
    if player_1 == player_2
      return "It's a draw"
    end

    if player_1 == 'rock' && player_2 == 'scissors' || player_1 == 'scissors' && player_2 == 'paper' || player_1 == 'paper' && player_2 == 'rock'
      return "#{player_1} player wins!"
    else
      return "#{player_2} player wins!"
    end
  end

  def computer
    ['rock', 'paper', 'scissors'].sample
  end
end
