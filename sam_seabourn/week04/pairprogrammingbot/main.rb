require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  erb :home
end

get '/bill' do
  erb :bill
end

get '/steve' do
  erb :steve
end

get '/dab' do
  erb :dab
end

get '/rave' do
  erb :rave
end

get '/scratch' do
  erb :scratch
end

get '/swag' do
  erb :swag
end
