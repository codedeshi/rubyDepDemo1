class User < ActiveRecord::Base
  has_secure_password
  has_many :groups
  has_many :meberships


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :fname, :lname, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
