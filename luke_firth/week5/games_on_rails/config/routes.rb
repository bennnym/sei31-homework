Rails.application.routes.draw do
root :to => 'pages#home'
get '/home' => 'pages#home'

get '/magic_eight' => 'games#magic_eight'

get '/rock_paper_scissors' => 'games#rock_paper_scissors'

get '/secret_number' => 'games#secret_number'



end
