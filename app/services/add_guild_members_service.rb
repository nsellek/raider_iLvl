class AddGuildMembersService < ApplicationController

  def self.add_member(member, current_user)
    toon = GuildMember.where(name: member['name'])
    if toon.empty?
      GuildMember.create!(name: member['name'], realm: member["realm"], level: member['level'], guild_id: current_user.guild.id, thumbnail: member['thumbnail'])
    else
      toon.update(name: member['name'], realm: member["realm"], level: member['level'], guild_id: current_user.guild.id, thumbnail: member['thumbnail'], updated_at: Time.now)
    end
  end
end
