require "open-uri"
class MemberAdderService
  def self.add_members(members, group)
    members.each do |member_id|
      member = Member.where(id: member_id)
      next unless member.empty?
      guild_member = GuildMember.find(member_id)
      response = HTTParty.get(URI::encode("https://us.api.battle.net/wow/character/#{guild_member.realm}/#{guild_member.name}?fields=items&locale=en_US&apikey=#{ENV["guild_raider_key"]}"))
      Member.create!(name: guild_member.name, realm: guild_member.realm, iLvl: response["items"]["averageItemLevelEquipped"], raid_group_id: group.id)
    end
  end
end
