require 'sinatra'
require 'json'

require 'pry' if Sinatra::Base.development?

require 'bundler'
Bundler.require

def get_definitions(word)
  uri = URI("https://api.quizlet.com/2.0/search/definitions")
  params = { :client_id => ENV['KEY'], :q => word }
  uri.query = URI.encode_www_form(params)
  JSON.parse(Net::HTTP.get_response(uri).body)
end

get '/' do
  erb :index
end

get '/search' do
  word = params[:q]
  results = get_definitions word
  arr = result['official_definitions'][0..3]['word'] + result['user_definitions'][0..3]['word']
end
