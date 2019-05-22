require 'sinatra'
require 'sqlite3'
require 'pry'
require 'sinatra/reloader'
require 'active_record'

# Rails will do all this for you automagically.
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'database.sqlite3'
)

ActiveRecord::Base.logger = Logger.new(STDERR)


class Pokemon < ActiveRecord::Base
  # belongs_to :region, :optional => true # Since Rails 5
end
#
# class Region < ActiveRecord::Base
#   # has_many :pokemon
# end

### Cross data goes here


get '/' do
  @pokemon = Pokemon.all
  erb :home
end

get '/edit' do
  @pokemon = Pokemon.all
  erb :edit
end

get '/edit/:id' do
  @pokemon = Pokemon.find params[:id]
  erb :editme
end

#Display all pokemon
get '/pokemon' do
  @pokemon = Pokemon.all
  erb :pokemon_list
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find params[:id]
  erb :pokemon_show
end

post '/edit/:id' do
  pokemon = Pokemon.find params[:id]
  pokemon.name = params[:name].capitalize
  pokemon.nickname = params[:nickname]
  pokemon.image = "https://img.pokemondb.net/artwork/large/#{ params[:name].downcase }.jpg"
  pokemon.type1 = params[:type1]
  pokemon.type2 = params[:type2]
  pokemon.save
  redirect to("/pokemon/#{ params[:id] }")
end


after do
  ActiveRecord::Base.connection.close
end


# binding.pry
