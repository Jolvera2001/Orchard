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
  # TODO: Keep emails unique; no repeating for query in signin
  # maybe this is doable within the model, look at mongoid docs
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

post "/signin" do
  user = User.find_by!(email: params[:email]) or halt 404, "User not found"
  redirect "/profile/#{user.id}"
end