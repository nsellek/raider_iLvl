class GuildController < ApplicationController
  def new
    @realm = RealmNameService.realm_name
    @guild = Guild.new
  end

  def create
    @guild = Guild.new(allowed_params)
    @guild.user_id = current_user.id
    if @guild.save!
      current_user.guild_id = @guild.id
      current_user.save!(validate: false)
      redirect_to dashboard_path
    else
      redirect_to new_guild_path
    end
  end

  def destory
  end

  def show
    @guild = Guild.find(params[:id])
    @members = GuildCharacterService.guild_roster(@guild)
  end

  private
    def allowed_params
      params.require(:guild).permit(:guild_name, :realm)
    end
end
