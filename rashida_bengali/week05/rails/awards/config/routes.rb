# == Route Map
#
#        Prefix Verb   URI Pattern                   Controller#Action
#          root GET    /                             pages#home
#     directors GET    /directors(.:format)          directors#index
#               POST   /directors(.:format)          directors#create
#  new_director GET    /directors/new(.:format)      directors#new
# edit_director GET    /directors/:id/edit(.:format) directors#edit
#      director GET    /directors/:id(.:format)      directors#show
#               PATCH  /directors/:id(.:format)      directors#update
#               PUT    /directors/:id(.:format)      directors#update
#               DELETE /directors/:id(.:format)      directors#destroy
#        movies GET    /movies(.:format)             movies#index
#               POST   /movies(.:format)             movies#create
#     new_movie GET    /movies/new(.:format)         movies#new
#    edit_movie GET    /movies/:id/edit(.:format)    movies#edit
#         movie GET    /movies/:id(.:format)         movies#show
#               PATCH  /movies/:id(.:format)         movies#update
#               PUT    /movies/:id(.:format)         movies#update
#               DELETE /movies/:id(.:format)         movies#destroy

Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :directors
  resources :movies
end
