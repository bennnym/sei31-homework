require "httparty"
require 'sinatra'
require 'sinatra/reloader'
require "pry"


get '/' do
  erb :form
end

get '/book_display' do
  title = params[:book_title]
  url = "https://www.googleapis.com/books/v1/volumes?q=title:#{title}"
  info = HTTParty.get url;
  @title = info['items'].first['volumeInfo']['title']
  @cover_image = info['items'].first['volumeInfo']['imageLinks']['thumbnail']
  @saleInfo = info["items"][1]["saleInfo"]
  @description = info["items"].first["volumeInfo"]["description"]
  erb :book_display

end
