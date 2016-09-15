class Guild < ApplicationRecord
  validates :guild_name, :realm, presence: true
  belongs_to :user
  has_many :raid_groups, dependent: :destroy
end
