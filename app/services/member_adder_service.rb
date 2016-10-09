require "open-uri"
class MemberAdderService
  def self.add_members(members, group)
    members.each do |member_id|
      member = GuildMember.find(member_id)
      RaidMember.create!(guild_member_id: member.id, raid_group_id: group.id)
      if member.ilvl.nil?
        response = HTTParty.get(URI::encode("https://us.api.battle.net/wow/character/#{member.realm}/#{member.name}?fields=items&locale=en_US&apikey=#{ENV["guild_raider_key"]}"))
        member.update(ilvl: response["items"]["averageItemLevelEquipped"])
      end
    end
  end
end
