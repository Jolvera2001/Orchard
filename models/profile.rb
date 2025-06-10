class Profile
  include Mongoid::Document

  field :username, type: String
  field :stub, type: String
end
