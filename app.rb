require 'sinatra'
require 'json'

require 'bundler'
Bundler.require

get '/' do
  "Hello World!"
end
