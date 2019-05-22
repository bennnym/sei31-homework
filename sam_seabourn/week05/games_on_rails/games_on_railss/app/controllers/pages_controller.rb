class PagesController < ApplicationController
  def home
    render :home
  end

  def magic8
    render :magic8
  end

  def magic8result
    @yourfortune = [
"It is certain.",
"It is decidedly so.",
"Without a doubt.",
"Yes - definitely.",
"You may rely on it.",
"As I see it, yes.",
"Most likely.",
"Outlook good.",
"Yes.",
"Signs point to yes.",
"Reply hazy, try again.",
"Ask again later.",
"Better not tell you now.",
"Cannot predict now.",
"Concentrate and ask again.",
"Don't count on it.",
"My reply is no.",
"My sources say no.",
"Outlook not so good.",
"Very doubtful."
].sample
    render :magic8
  end


  def secretnumber
    render :secretnumber
  end

  def snresult
    @computers_number = [*1..10].sample
    @userguess = params[:userguess].to_i
    if @userguess  == @computers_number
      @result = "Dam Dawg, good guess. It was #{ @userguess }"
    else
      @result = "Incorrect guess brah, you picked #{ @userguess } and it was actually #{ @computers_number }. Try again!"
    end
    render :secretnumber
end

  def psrresult
    @computer_pick = ["Rock", "Paper","Scissors"].sample
    @userpick = params[:userpick]
    if @userpick == @computer_pick
      @result = "Rematch"
    elsif (@userpick == "Rock" && @computer_pick == "Scissors") || (@userpick == "Paper" && @computer_pick == "Rock") || (@userpick == "Scissors" && @computer_pick == "Paper")
      @result = "You win G"
    else
      @result = "You got screwed brah"
   end
    render :psr
  end
end
