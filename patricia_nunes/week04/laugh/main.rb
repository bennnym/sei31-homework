require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

#HOME
get '/' do
  erb :home
end

#INDEX
get '/laugh' do
  @laughs = query_db "SELECT * FROM laugh"
  erb :laugh_index
end

#READ
get '/laugh/:id' do
  laugh = query_db "SELECT * FROM laugh WHERE id=#{ params[:id] }"
  @laugh = laugh.first
  erb :laugh_show
end

#Edit form
get '/laugh/:id/edit' do
  laugh = query_db "SELECT * FROM laugh WHERE id=#{ params[:id] }"
  @laugh = laugh.first
  erb :laugh_edit
end

#Update
post '/laugh/:id' do
  query = "UPDATE laugh SET name='#{params[:name]}', laugh='#{params[:laugh]}', gif='#{params[:gif]}' WHERE id=#{params[:id]}"
  query_db query
  redirect to("/laugh/#{params[:id] }")
end

def query_db(sql_statement)
  puts sql_statement #optional to see in commond line
  db = SQLite3::Database.new 'database.sqlite3'
  db.results_as_hash = true
  result = db.execute sql_statement
  db.close
  result #implicitly return
end
