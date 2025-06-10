require 'dotenv/load'
require 'sinatra'
require 'mongoid'
require 'haml'

Mongoid.load!('config/mongoid.yml', :development)

require_relative 'models/test_model'

set :haml, :format => :html5

# Views

get "/" do
  haml :index
end

get "/signup" do
  haml :signup
end

get "/profile/:id" do
  id = params['id']
  haml :profile
end

# APIs

post "/signup" do

end