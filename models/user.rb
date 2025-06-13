require 'bcrypt'
class User
  include Mongoid::Document

  field :email, type: String
  field :password_hash, type: String

  has_many :profile, dependent: :destroy

  def password=(new_password)
    self.password_hash = BCrypt::Password.create(new_password, cost: 12)
  end

  def authenticate(password)
    BCrypt::Password.new(password_hash) == password
  end
end
