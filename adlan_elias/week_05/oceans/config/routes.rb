# == Route Map
#
#     Prefix Verb   URI Pattern                Controller#Action
#       root GET    /                          oceans#index
#     oceans GET    /oceans(.:format)          oceans#index
#            POST   /oceans(.:format)          oceans#create
#  new_ocean GET    /oceans/new(.:format)      oceans#new
# edit_ocean GET    /oceans/:id/edit(.:format) oceans#edit
#      ocean GET    /oceans/:id(.:format)      oceans#show
#            PATCH  /oceans/:id(.:format)      oceans#update
#            PUT    /oceans/:id(.:format)      oceans#update
#            DELETE /oceans/:id(.:format)      oceans#destroy

Rails.application.routes.draw do
  root :to => 'oceans#index'
  resources :oceans
end
