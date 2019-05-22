require 'sqlite3'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.sqlite3'
)

class Cheese < ActiveRecord::Base
  #nothing
end

#Home Page
get '/' do
	erb :home
end

#List of cheeses
get '/cheeses' do
	@cheeses = Cheese.all
	puts @cheeses.to_s
	erb :index
end

#Form to add a new cheese
get '/cheeses/new/' do
	erb :new
end

# Add a new cheese to sql
post '/cheeses' do
  cheese = Cheese.new
  cheese.name = params[:name]
  cheese.texture = params[:texture]
  cheese.image = params[:image]
  cheese.save
	redirect to("/cheeses/#{ cheese.id }") #GET request
end

#Show individual cheeses
get '/cheeses/:id' do
	@cheese = Cheese.find params[:id]
	puts @cheese.to_s
	erb :show
end

#Edit cheeses
get '/cheeses/edit/:id' do
	@cheese = Cheese.find params[:id]
	puts @cheese.to_s
	erb :edit
end

#Update Cheeses
post '/cheeses/:id' do
	cheese = Cheese.find params[:id]
	cheese.name = params[:name]
	cheese.texture = params[:texture]
	cheese.image = params[:image]
	cheese.save
	redirect to("/cheeses/#{params[:id]}") #GET request
end

#Delete Cheeses
get '/cheeses/:id/delete/' do
	cheese = Cheese.find params[:id]
	cheese.destroy
	redirect to("/cheeses")
end

after do
  ActiveRecord::Base.connection.close
end
