class SecretController < ApplicationController

	def secret
		render :secret_number
	end

	def secret_response
		random_n = Random.new
		@random_n = random_n.rand(10) + 1
		render :secret_response
	end
end
