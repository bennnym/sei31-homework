require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'

# Rails will do all this for you automagically.
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.sqlite3'
)

# Optional bonus
ActiveRecord::Base.logger = Logger.new(STDERR)

# Models
class Story < ActiveRecord::Base
  belongs_to :author, :optional => true # Since Rails 5
end

class Author < ActiveRecord::Base
  has_many :stories
end

get '/' do
  erb :home
end

# INDEX - Show all butterflies
get '/stories' do
  @stories = Story.all
  erb :stories_index
end

# NEW
get '/stories/new' do
erb :stories_new
end

#CREATE
post '/stories' do
story = Story.new
story.name =  params[:name]
story.family = params[:family]
story.image = params[:image]
story.author_id = params[:author_id]
story.save
redirect to("/stories/#{story.id}")
end

#SHOW
get '/stories/:id' do
@story = Story.find params[:id]
erb :stories_show
end

#EDIT
get '/stories/:id/edit' do
@story = Story.find params[:id]
erb :stories_edit
end

#UPDATE
post '/stories/:id' do
story = Story.find params[:id]
story.name = params[:name]
story.family = params[:family]
story.image = params[:image]
story.author_id = params[:author_id]
story.save
redirect to("/stories/#{params[:id]}")
end

#DELETE
get '/stories/:id/delete' do
story = Story.find params[:id]
story.destroy
redirect to("/stories")
end


# AUTHOR CURD FROM HERE

#INDEX
get '/authors' do
@authors = Author.all
erb :authors_index
end

#NEW
get '/authors/new' do
erb :authors_new
end

#CREATE
post '/authors' do
author = Author.new
author.name = params[:name]
author.image = params[:image]
author.save
redirect to("/authors/#{author.id}")
end

#SHOW

get '/authors/:id' do
@author = Author.find params[:id]
erb :authors_show
end

#EDIT
get '/authors/:id/edit' do
@author = Author.find params[:id]
erb :authors_edit
end

#UPDATE
post '/authors/:id' do
author = Author.find params[:id]
author.name = params[:name]
name.image = params[:image]
author.save
redirect to("/authors/#{params[:id]}")
end

#DELETE
get '/authors/:id/delete' do
author = Author.find params[:id]
author.destroy
redirect to("/authors")
end

after do
  ActiveRecord::Base.connection.close
end
