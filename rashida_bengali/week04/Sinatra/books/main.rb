require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

get '/' do
  erb :form
end

get '/result' do

  @title = params[:title]
  url = "https://www.googleapis.com/books/v1/volumes?q=title:#{@title}"
  @info  = HTTParty.get url

  @book_cover = @info["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
  @authors = @info["items"][0]["volumeInfo"]["authors"].join(", ")

  erb :result

  #if x == "yes"
  #  erb :yesPage
  #elsif x == "no"
  #  erb: nopage
  #end
end

# binding.pry
