require 'dotenv/load'
require 'sinatra'
require 'mongoid'
require 'haml'

Mongoid.load!('config/mongoid.yml', :development)

require_relative 'models/user'

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
  @profile = User.find(id)

  haml :profile
end

# APIs

post "/signup" do
  user = User.create!(
    email: params[:email],
    password: params[:password],
  )

  if user.save
    "User Create Successfully"
  else
    "Error occurred!"
  end
end