class RaidMember < ApplicationRecord
  belongs_to :guild_member
  belongs_to :raid_group
end
