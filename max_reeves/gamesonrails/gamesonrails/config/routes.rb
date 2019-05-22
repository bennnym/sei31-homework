Rails.application.routes.draw do

	root :to => 'pages#index'

	get '/magic' => 'magic#magic_8_ball'
	get '/magic/response' => 'magic#magic_response'

	get '/secret' => 'secret#secret_number'
	get '/secret/response' => 'secret#secret_response'

	get '/rock' => 'rock#rock_paper_scissors'
	get '/rock/response' => 'rock#rock_response'



end
