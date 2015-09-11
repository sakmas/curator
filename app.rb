require 'sinatra'

get '/' do
  @title = "こんにちは"
  erb :index
end
