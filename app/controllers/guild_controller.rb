class GuildController < ApplicationController
  def new
    @guild = Guild.new
  end

  def create
    @guild = Guild.new(allowed_params)

    if @guild.save!
      redirect_to dashboard_path
    else
      redirect_to new_guild_path
    end
  end

  def destory
  end

  private
    def allowed_params
      params.require(:guild).permit(:guild_name, :realm)
    end
end
