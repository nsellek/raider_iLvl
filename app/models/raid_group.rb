class RaidGroup < ApplicationRecord
  has_many :raid_members, dependent: :destroy
  has_many :guild_members, through: :raid_members
end
