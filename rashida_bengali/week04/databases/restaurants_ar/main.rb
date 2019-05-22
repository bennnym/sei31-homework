require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.sqlite3'
)

# Optional bonus
ActiveRecord::Base.logger = Logger.new(STDERR)

class Restaurant < ActiveRecord::Base
  belongs_to :cuisine, :optional => true
end

class Cuisine < ActiveRecord::Base
  has_many :restaurants
end

get '/' do
  erb :home
end

get  '/restaurants' do
  @restaurants = Restaurant.all
  erb :restaurants_list
end

get '/restaurants/new' do
  erb :restaurants_add
end

post '/restaurants' do
  restaurant = Restaurant.new
  restaurant.name = params[:name]
  restaurant.cuisine_id = params[:cuisine_id]
  restaurant.location = params[:location]
  restaurant.image = params[:image]
  restaurant.save

  redirect to ('/restaurants')
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find params[:id]
  erb :restaurants_show
end

get '/restaurants/:id/edit' do
  @restaurant = Restaurant.find params[:id]
  erb :restaurants_edit
end

post '/restaurants/:id' do
  restaurant = Restaurant.find params[:id]
  restaurant.name = params[:name]
  restaurant.cuisine_id = params[:cuisine_id]
  restaurant.location = params[:location]
  restaurant.image = params[:image]
  restaurant.save

  redirect to ("/restaurants/#{params[:id]}")
end

get '/restaurants/:id/delete' do
  restaurant = Restaurant.find params[:id]
  restaurant.destroy

  redirect to ('/restaurants')
end

##################################################################

get '/cuisines' do
  @cuisines = Cuisine.all
  erb :cuisines_list
end

get '/cuisines/new' do
  erb :cuisines_add
end

post '/cuisines' do
  cuisine = Cuisine.new
  cuisine.name = params[:name]
  cuisine.image = params[:image]
  cuisine.save

  redirect to ('/cuisines')
end

get '/cuisines/:id' do
  @cuisine = Cuisine.find params[:id]
  erb :cuisines_show
end

get '/cuisines/:id/edit' do
  @cuisine = Cuisine.find params[:id]
  erb :cuisines_edit
end

post '/cuisines/:id' do
  cuisine = Cuisine.find params[:id]
  cuisine.name = params[:name]
  cuisine.image = params[:image]
  cuisine.save

  redirect to ("/cuisines/#{params[:id]}")
end

get '/cuisines/:id/delete' do
  cuisine = Cuisine.find params[:id]
  cuisine.destroy

  redirect to ('/cuisines')
end
