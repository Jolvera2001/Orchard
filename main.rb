require 'dotenv/load'
require 'sinatra'
require 'mongoid'
require 'haml'

Mongoid.load!('config/mongoid.yml', :development)

require_relative 'models/user'
require_relative 'models/profile'

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
  @profile = Profile.find(id)

  haml :profile
end

# APIs

post "/signup" do
  user = User.create!(
    email: params[:email],
    password: params[:password],
  )
  profile = user.profiles.create(
    username: params[:username],
    slug: params[:slug]
  )

  redirect "/profile/#{profile.id}"
end

post "/signin" do
  user = User.find_by!(email: params[:email]) or halt 404, "User not found"
  profile = user.profiles.first
  redirect "/profile/#{profile.id}"
end