Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'games#home'
  get '/home' => 'games#home'

  get '/8ball' => 'magic#question'
  get '/8ball/magic' => 'magic#answer'

  get '/secretnumber' => 'secret#guess'
  get '/secretnumber/secret' => 'secret#true_or_false'

  get '/rockpaperscissors' => 'rps#rock_paper_scissors'
  get '/rockpaperscissors/play' => 'rps#win_or_lose'
end
