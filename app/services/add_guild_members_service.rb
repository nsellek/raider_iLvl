class AddGuildMembersService < ApplicationController

  def self.add_member(member, current_user)
    toon = GuildMember.where(name: member['name'])
    if toon.empty?
      GuildMember.create!(name: member['name'], realm: member["realm"], level: member['level'], guild_id: current_user.guild.id)
    else
      toon.update(name: member['name'], realm: member["realm"], level: member['level'], guild_id: current_user.guild.id)
    end
  end
end
