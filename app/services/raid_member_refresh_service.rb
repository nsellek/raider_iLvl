require "open-uri"
class RaidMemberRefreshService
  def self.refresh_members(members)
    members.each do |member|
      response = HTTParty.get(URI::encode("https://us.api.battle.net/wow/character/#{member.realm}/#{member.name}?fields=items&locale=en_US&apikey=#{ENV["guild_raider_key"]}"))
      member.update(ilvl: response['items']['averageItemLevelEquipped'])
    end
  end
end
