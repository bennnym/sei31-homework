# == Route Map
#
#        Prefix Verb   URI Pattern                   Controller#Action
#     mountains GET    /mountains(.:format)          mountains#index
#               POST   /mountains(.:format)          mountains#create
#  new_mountain GET    /mountains/new(.:format)      mountains#new
# edit_mountain GET    /mountains/:id/edit(.:format) mountains#edit
#      mountain GET    /mountains/:id(.:format)      mountains#show
#               PATCH  /mountains/:id(.:format)      mountains#update
#               PUT    /mountains/:id(.:format)      mountains#update
#               DELETE /mountains/:id(.:format)      mountains#destroy

Rails.application.routes.draw do
  root :to => 'mountains#index'
  resources :mountains
end
