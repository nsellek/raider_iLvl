class GuildMembersController < ApplicationController

  def refresh_guild
    guild = current_user.guild
    GuildCharacterService.guild_roster(guild, current_user)
    redirect_to guild_path(guild)
  end

end
