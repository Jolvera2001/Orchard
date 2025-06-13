class Profile
  include Mongoid::Document

  field :username, type: String
  field :slug, type: String

  validate :slug , uniqueness: { message: "slug has already been taken" }

  belongs_to :user
end
