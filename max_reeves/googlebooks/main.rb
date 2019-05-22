require "sinatra"
require "httparty"
require "json"

get '/' do
	erb :main_search
end

get '/search' do
	response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{params[:search]}")

	title = response.parsed_response["items"][0]["volumeInfo"]["title"]
	description = response.parsed_response["items"][0]["volumeInfo"]["description"]
	image_link = response.parsed_response["items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"]

	erb :result, locals: {title: title, description: description, image_link: image_link }
end

#{params[:search]}
