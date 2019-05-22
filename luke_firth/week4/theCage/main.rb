require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
  erb :home
end

get '/movies' do
  @cage = query_db "SELECT * FROM cage"
  erb :cage_index
end
