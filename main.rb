require 'sinatra'
require 'haml'

set :haml, :format => :html5

get "/" do
  haml :index
end

get "/profile" do
  haml :profile
end

get "/dashboard" do
  haml :dashboard
end

get "/users/:stub" do
  @stub = params[:stub]
  @user_name = 'Test User'
  @page_title = "#{@user_name}'s Profile: Stub is - #{@stub}"

  haml :user
end