require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
  erb :home
end

get '/restaurants' do
  @restaurants = query_db 'SELECT * FROM restaurants'
  erb :restaurants_list
end

get '/restaurants/add' do
  erb :restaurants_add
end

post '/restaurants' do
  query = "INSERT INTO restaurants (name, cuisine, location, image) VALUES ('#{params[:name]}', '#{params[:cuisine]}', '#{params[:location]}', '#{params[:image]}')"
  query_db query
  redirect to ('/restaurants')
end

get '/restaurants/:id' do
  restaurants = query_db "SELECT * FROM restaurants WHERE id=#{params[:id]}"
  @restaurant = restaurants.first
  erb :restaurants_show
end

get '/restaurants/:id/edit' do
  restaurants = query_db "SELECT * FROM restaurants WHERE id=#{params[:id]}"
  @restaurant = restaurants.first
  erb :restaurants_edit
end

post '/restaurants/:id' do
  #params.to_s
  query = "UPDATE restaurants SET name='#{params[:name]}', cuisine='#{params[:cuisine]}', location='#{params[:location]}', image='#{params[:image]}' WHERE id=#{params[:id]}"
  #query
  query_db query
  redirect to ("/restaurants/#{params[:id]}")
end

get '/restaurants/:id/delete' do
  query_db "DELETE FROM restaurants WHERE id=#{params[:id]}"
  redirect to ("/restaurants")
end

def query_db(sql_statement)
  puts sql_statement #optional feature which is nice for debugging
  db = SQLite3::Database.new 'database.sqlite3'
  db.results_as_hash = true
  result = db.execute sql_statement
  db.close
  result #Implicitly returned
end
