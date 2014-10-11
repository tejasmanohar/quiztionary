require 'sinatra'
require 'json'

require 'bundler'
Bundler.require

get '/' do
  erb :index
end
