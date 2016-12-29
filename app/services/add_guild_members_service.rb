class AddGuildMembersService < ApplicationController
  @@class = {1 => "Warrior", 2 => "Paladin", 3 => "Hunter", 4 => "Rouge", 5 => "Priest", 6 => "Death Knight", 7 => "Shaman", 8 => "Mage", 9 => "Warlock", 10 => "Monk", 11 => "Druid", 12 => "Demon Hunter" }
  def self.add_member(member, current_user)
    toon = GuildMember.where(name: member['name'])
    if toon.empty?
      GuildMember.create!(name: member['name'], realm: member["realm"], level: member['level'], guild_id: current_user.guild.id, thumbnail: member['thumbnail'], class_name: @@class[member["class"]])
    else
      toon.update(name: member['name'], realm: member["realm"], level: member['level'], guild_id: current_user.guild.id, thumbnail: member['thumbnail'], updated_at: Time.now, class_name: @@class[member["class"]])
    end
  end
end
