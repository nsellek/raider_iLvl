class GuildsController < ApplicationController
  before_filter :find_guild, only: [:show, :destroy]
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

  def destroy
    @guild.destroy!
    current_user.update(guild_id: nil)
    redirect_to dashboard_path
  end

  def show
    @members = GuildCharacterService.guild_roster(@guild)
  end

  private
    def allowed_params
      params.require(:guild).permit(:guild_name, :realm)
    end

    def find_guild
      @guild = Guild.find(params[:id])
    end
end
