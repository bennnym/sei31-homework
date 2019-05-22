require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
  erb :home
end

# INDEX
get '/doggos' do
  @doggo = query_db 'SELECT * FROM doggos'
  erb :doggos_index
end

# NEW - Form for adding a new doggo
get '/doggos/new' do
  erb :doggos_new
end

# CREATE - Add a new doggo to the database
post '/doggos' do
  query = "INSERT INTO doggos (name, treats, image) VALUES ('#{params[:name]}', '#{params[:treats]}', '#{params[:image]}')"
  query_db query
  redirect to('/doggos') # GET request
end

# SHOW - Shows a single doggo in more detail
get '/doggos/:id' do
  doggos = query_db "SELECT * FROM doggos WHERE id=#{ params[:id] }"
  @doggo = doggos.first
  erb :doggos_show
end

# EDIT - Shows a form to edit a single doggo
get '/doggos/:id/edit' do
  doggos = query_db "SELECT * FROM doggos WHERE id=#{ params[:id] }"
  @doggo = doggos.first
  erb :doggos_edit
end

# UPDATE - Modify the database with new information for a particular doggo
post '/doggos/:id' do
  query = "UPDATE doggos SET name='#{params[:name]}', treats='#{params[:treats]}', image='#{params[:image]}' WHERE id=#{params[:id]}"
  query_db query
  redirect to("/doggos/#{ params[:id] }")
end

# DESTROY - Deletes a given a doggo from the database
get '/doggos/:id/delete' do
  query_db "DELETE FROM doggos WHERE id=#{ params[:id] }"
  redirect to("/doggos")
end

def query_db(sql_statement)
  db = SQLite3::Database.new 'database.sqlite3'
  db.results_as_hash = true
  result = db.execute sql_statement
  db.close
  result # Implicitly returned
end
