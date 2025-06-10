require 'dotenv/load'
require 'sinatra'
require 'mongoid'
require 'haml'

Mongoid.load!('config/mongoid.yml', :development)

require_relative 'models/test_model'

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

# Testing Mongoid here

post "/testadd" do
  TestModel.create!(name: 'Test Man!', age: 50)
  "TestModel Created!"
end

get "/testseeadded" do
  content_type :json
  TestModel.all.to_json
end