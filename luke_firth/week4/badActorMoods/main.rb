require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

#Rails will do all this for you automagically
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.sqlite3'
)
ActiveRecord::Base.logger = Logger.new(STDERR)

#Models
class Actor < ActiveRecord::Base
  belongs_to :moods, :optional => true
end

class Moods < ActiveRecord::Base
  has_many :actors
end

get '/' do
  erb :home
end

#INDEX - Show all actors
get '/actors' do
  @actors = Actor.all
  erb:actors_index
end
#NEW - Form for adding a new actor
get '/actors/new' do
  erb :actors_new
end

#CREATE - Add a new actor to the database
post '/actors' do
  actor = Actor.new
  actor.firstName = params[:firstName]
  actor.lastName = params[:lastName]
  actor.image = params[:image]
  actor.mood_id = params[:mood_id]
  actor.save

  redirect to("/actors/#{ actor.id }") #GET request
end

#SHOW - Sows a single actor in more details
get '/actors/:id' do
  @actor = Actor.find params[:id]
  erb :actors_show
end

#EDIT - Shows a form to edit a single actor
get '/actors/:id/edit' do
  @actor = Actor.find params[:id]
  erb :actors_edit
end

#UPDATE - Modify the database with new information for a particular actor
post '/actors/:id' do
  actor = Actor.find params[:id]
  actor.mood = params[:fistName]
  actor.mood = params[:lastName]
  actor.image = params[:image]
  actor.mood_id = params[:mood_id]
  actor.save
  redirect to("/butterflies/#{ params[:id] }")
end

#Moodss
#IDEX
# INDEX
get '/moods' do
  @moods = Moods.all
  erb :moods_index
end

# NEW
get '/moods/new' do
  erb :moods_new
end

# CREATE
post '/moods' do
  mood = Moods.new
  mood.mood = params[:moods]
  mood.image = params[:image]
  mood.save
  redirect to("/moods/#{ mood.id }")
end

# SHOW
get '/moods/:id' do
  @mood = Moods.find params[:id]
  erb :moods_show
end

# EDIT
get '/moods/:id/edit' do
  @mood = Moods.find params[:id]
  erb :moods_edit
end

# UPDATE
post '/moods/:id' do
  mood = Moods.find params[:id]
  mood.mood = params[:moods]
  mood.image = params[:image]
  mood.save
  redirect to("/moods/#{ mood.id }")
end

# DELETE
get '/moods/:id/delete' do
  mood = Moods.find params[:id]
  mood.destroy
  redirect to("/moods")
end

after do
  ActiveRecord::Base.connection.close
end
