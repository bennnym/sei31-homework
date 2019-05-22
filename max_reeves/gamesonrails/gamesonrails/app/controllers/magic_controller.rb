class MagicController < ApplicationController

	def magic_8_ball
		render :magic_8_ball
	end

	def magic_response
		fortune = ["It is certain.","It is decidedly so.","Without a doubt.","Yes - definitely.","You may rely on it.","As I see it, yes.","Most likely.","Outlook good.","Yes.","Signs point to yes.","Reply hazy, try again.","Ask again later.","Better not tell you now.","Cannot predict now.","Concentrate and ask again.","Don't count on it.","My reply is no.","My sources say no.","Outlook not so good.","Very doubtful."]

		random_n = Random.new
		@message = fortune[random_n.rand(20)]

		render :magic_response
	end

end
