Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#home' # home page
  get '/home' => 'pages#home'

  get '/eight_ball' => 'pages#eight_ball'
  get '/eight_result' => 'pages#eight_result'


  get '/secret_number' => 'pages#secret_number'
  get '/secret_number/result' => 'pages#secret_number_result'

  get '/rock_paper_scissors' => 'pages#rock_paper_scissors'
  get '/rock_paper_scissors/result' => 'pages#rock_paper_scissors_result'

end
