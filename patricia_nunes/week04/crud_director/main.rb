require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.sqlite3'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

class Director < ActiveRecord::Base
  belongs_to :movies, :optional => true
end

class Movie < AtiveRecord::Database
  has_many :directors
end

#HOME
get '/' do
  erb :home
end

#INDEX all directors
get '/directors' do
  @directors = Director.all
  erb :directors_index
end

# NEW - Form for adding a new butterfly
get '/directors/new' do
  erb :directors_new
end

#CREATE - add a new
post '/directors' do
  director = Director.new
  director.name = params[:name]
  director.age = params[:age]
  director.photo = params[:photo]
  director.save
  redirect to("/directors/#{ director.id }")
end

# EDIT - Shows a form to edit a single butterfly
get '/directors/:id/edit' do
  @director = Director.find params[:id]
  erb :directors_edit
end

#UPDATE - modify the database with new information dor a particular butterfly
post '/directors/:id' do
  director = Director.find params[:id]
  director.name = params[:name]
  director.age = params[:age]
  director.photo = params[:photo]
  director.save
  redirect to("/directors/#{ params[:id]}")
end

# SHOW
get '/directors/:id' do
  @director = Director.find params[:id]
  erb :directors_show
end

#DESTROY - Deletes a given a butterfly from Database
get '/directors/:id/delete' do
  director = Director.find params[:id]
  director.destroy
  redirect to("/directors")
end

######################### movies

get '/movies' do
  @movies = Movie.all
  erb :movies_index
end

# NEW
get '/movies/new' do
  erb :movies_new
end


after do
  ActiveRecord::Base.connection.close
end
