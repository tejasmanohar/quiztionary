# require necessary gems
require 'sinatra'
require 'json'
require 'pry' if Sinatra::Base.development?

# search quizlet sets for word's definition
def get_entries(word)
  uri = URI("https://api.quizlet.com/2.0/search/definitions")
  params = { :client_id => ENV['KEY'], :q => word }
  uri.query = URI.encode_www_form(params)
  JSON.parse(Net::HTTP.get_response(uri).body)['official_definitions'][0..2]
end

# display homepage
get '/' do
  erb :index
end

# parse and display results from search
get '/search' do
  word = params[:q]
  @results = get_entries word
  puts @results
  erb :search
end
