require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do
  erb :have_a_test
end

get '/need_refactor' do
  erb :need_refactor
end

get '/new_feature' do
  erb :new_feature
end

get '/refactor_code' do
  erb :refactor_code
end

get '/test_pass' do
  erb :test_pass
end

get '/write_code' do
  erb :write_code
end

get '/write_test' do
  erb :write_test
end
