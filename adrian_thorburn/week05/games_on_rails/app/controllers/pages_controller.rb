class PagesController < ApplicationController
  def home
    render :home
  end

  def eight_ball
    render :eight_ball
  end

  def eight_result
    @question = params[:question]
    results = ["It is certain.","It is decidedly so.","Without a doubt.","Yes - definitely.","You may rely on it.","As I see it, yes.","Most likely.","Outlook good.","Yes.","Signs point to yes.","Reply hazy, try again.","Ask again later.","Better not tell you now.","Cannot predict now.","Concentrate and ask again.","Don't count on it.","My reply is no.","My sources say no.","Outlook not so good.","Very doubtful."]
    @fortune = results.sample
    render :eight_result
  end

  def secret_number
    render :secret_number
  end

  def secret_number_result
    @user_guess = params[:userguess].to_i
    @machine_guess = rand(1..10)
    if @userguess == @machine_guess
      @result = "you win #{@user_guess} matches #{@machine_guess}"
    else
      @result = "you lose #{@user_guess} doesn't match #{@machine_guess}"
    end
  render :secret_number_result
  end

  def rock_paper_scissors
    render :rock_paper_scissors
  end

  def rock_paper_scissors_result
    @user_throw = params[:user_throw].to_i
    @machine_throw = rand(1..3)
    if @user_throw == @machine_throw
      @result = "both the same, throw again"
    elsif @user_throw == 1 && @machine_throw == 3
      @result = "Rock smashes Scissors, you win!"
    elsif @user_throw == 2 && @machine_throw == 1
      @result = "Paper wraps rock, you win!"
    elsif @user_throw == 3 && @machine_throw == 2
      @result = "scissors cuts paper, you win!"
    else
      @result = "you lose"
    end
    # raise 'hell'
    render :rock_paper_scissors_result
  end
end
