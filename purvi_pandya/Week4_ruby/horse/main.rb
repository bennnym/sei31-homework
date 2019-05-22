require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
erb :home
end

#Index - It will show all my favorite Horses
get '/horse' do
# db = SQLite3::Database.new 'database.sqlite3'
# db.results_as_hash = true
@horse = query_db "SELECT * FROM horse"
erb :horse_index
end

#New - it is a form to add new horse.
get '/horse/new' do
  erb :horse_new
end
#Create - new horse pic for Database
post '/horse' do
query = "INSERT INTO horse ('name','type','image') VALUES ('#{params[:name]}','#{params[:type]}','#{params[:image]}')"
query_db query
redirect to('/horse')
end

#Show - it will show a single horse

get '/horse/:id' do

horse = query_db "SELECT * FROM horse WHERE id=#{params[:id]}"
@horse = horse.first
erb :horse_show
end

#EDIT - add horse
get '/horse/:id/edit' do
horse = query_db "SELECT * FROM  horse WHERE id=#{params[:id]}"
@horse = horse.first
erb :horse_edit
end

#UPDATE action - modify the databse with new information for a particular horse

post '/horse/:id' do
query = "UPDATE horse SET name='#{params[:name]}', type='#{params[:type]}', image='#{params[:image]}' WHERE id=#{params[:id]}"
query_db query
redirect to("/horse/#{params[:id]}")
end

#DELETE action - deletes a given horse image from the database
get '/horse/:id/delete' do
query_db "DELETE FROM horse WHERE id=#{params[:id]}"
redirect to("/horse")
end


def query_db(sql_statement)
  puts sql_statement #optional feature nice for debugging.
  db = SQLite3::Database.new 'database.sqlite3'
  db.results_as_hash = true
  result = db.execute sql_statement
  db.close
  result # Implicity returned
end
