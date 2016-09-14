class User < ApplicationRecord
  validates :user_name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_one :guild
end
