class GuildMembersController < ApplicationController

  def refresh_guild
    guild = current_user.guild
    # binding.pry
    GuildCharacterService.guild_roster(guild, current_user)
    redirect_to guild_path(guild)
  end

end
