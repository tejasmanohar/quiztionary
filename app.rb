# require necessary gems
require 'sinatra'
require 'json'
require 'pry' if Sinatra::Base.development?
require 'bundler'

# ensure gem bundling
Bundler.require

# search quizlet sets for word's definition
def get_entries(word)
  uri = URI("https://api.quizlet.com/2.0/search/definitions")
  params = { :client_id => ENV['KEY'], :q => word }
  uri.query = URI.encode_www_form(params)
  JSON.parse(Net::HTTP.get_response(uri).body)['official_definitions']
end

# display homepage
get '/' do
  erb :index
end

get '/about' do
  erb :about
end

# parse and display results from search
get '/search' do
  word = params[:q]
  @results = get_entries word
  erb :search
end
