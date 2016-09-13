class Guild < ApplicationRecord
  validates :guild_name, :realm, presence: true
  belongs_to :user
end
