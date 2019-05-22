class RockController < ApplicationController

	def rock
		render :rock_paper_scissors
	end

	def rock_response
		rps = ["Rock", "Paper", "Scissors"]
		random_n = Random.new
		@rps = rps[random_n.rand(3)]
		render :rock_response
	end

end
