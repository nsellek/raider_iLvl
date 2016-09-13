class User < ApplicationRecord
  validates :user_name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_one :guild
end
