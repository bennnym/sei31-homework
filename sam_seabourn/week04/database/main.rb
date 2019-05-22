require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

#These are basically functions that are executed when the conditions have been met, IE submitting a form
get '/' do
  erb :home
end

get '/home' do
  erb :home
end

get '/lies' do
  @all_lies = query_db 'SELECT * FROM lies'
  erb :lies_index
end

get '/lies/new' do
  erb :lies_new
end

get '/lies/:id' do #: ":id" here is just a place holder to search the hash
  lies = query_db "SELECT * FROM lies WHERE id=#{ params[:id] }"
  @lies = lies.first
  erb :lies_display
end

post '/lies' do
  query = "INSERT INTO lies (username, lie) VALUES ('#{params[:username]}','#{params[:lie]}')"
  query_db query
  redirect to('/lies')
end

#Delete action
get '/lies/:id/delete' do
  query_db "DELETE FROM lies WHERE id=#{params[:id]};"
  redirect to("/lies")
end


#edit a lie
get '/lies/:id/:edit' do
lies = query_db "SELECT * FROM lies WHERE id=#{ params[:id] }"
@lies = lies.first
erb :lies_edit
end

post '/lies/:id' do
  query = "UPDATE lies SET username='#{params[:username]}', lie='#{params[:lie]}' WHERE id=#{params[:id]};" #This is planting the params into the string of SQL code
  query_db query #this is sending the SQL code to the db.
  redirect to ("/lies/#{params[:id]}")
end



#Database Query - Method
def query_db(sql_statement)
  puts sql_statement
  db = SQLite3::Database.new 'database.sqlite3' #Defining the variable 'db'
  db.results_as_hash = true #converting the queried item to a usable hash
  result = db.execute sql_statement #Executes the command
  db.close
  result #Implicitly returns
end
