Rails.application.routes.draw do

root :to => 'pages#home'
get 'home' => 'pages#home'
get 'magic8' => 'pages#magic8'
post 'magic8' => 'pages#magic8result'
get 'secretnumber' => 'pages#secretnumber'
post 'secretnumber' => 'pages#snresult'
get 'psr' => 'pages#psr'
post 'psr' => 'pages#psrresult'



end
