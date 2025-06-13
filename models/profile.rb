class Profile
  include Mongoid::Document

  field :username, type: String
  field :stub, type: String

  belongs_to :user
end
