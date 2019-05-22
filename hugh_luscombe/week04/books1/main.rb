require "sinatra"
require "sinatra/reloader"
require "httparty"

get '/' do
  erb :home
end

get '/infopage' do
  @title = params[:title]
  url = "https://www.googleapis.com/books/v1/volumes?q=title:#{@title}"
  @info = HTTParty.get url
  @got_title = @info["items"][0]["volumeInfo"]["title"]
  @authors = @info["items"][0]["volumeInfo"]["authors"][0]
  @publishedDate = @info["items"][0]["volumeInfo"]["publishedDate"]
  @pageCount = @info["items"][0]["volumeInfo"]["pageCount"]
  @book_cover = @info["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
  @description = @info["items"][0]["volumeInfo"]["description"]

  erb :infopage
end
