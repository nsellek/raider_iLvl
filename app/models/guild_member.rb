class GuildMember < ApplicationRecord
  belongs_to :guild
  has_many :raid_members, dependent: :destroy
end
