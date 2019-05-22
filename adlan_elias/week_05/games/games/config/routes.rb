Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root :to => 'games#home'
get '/games/8ball' => 'games#magicball', :as => 'magicball'
get '/games/8ball/result' => 'games#magicresult', :as => 'magicresult'
get '/games/guess' => 'games#numberguess', :as => 'numberguess'
get '/games/guess/success' => 'games#numberguesssuccess', :as => 'numberguesssuccess'
get '/games/guess/fail' => 'games#numberguessfail', :as => 'numberguessfail'
get '/games/rps' => 'games#rockpaperscissors', :as => 'rockpaperscissors'
get '/games/rps/rock' => 'games#rock', :as => 'rock'
get '/games/rps/youlose' => 'games#rpsfail', :as => 'rpsfail'

end
