class RaidGroupsController < ApplicationController

  def new
    @group = RaidGroup.new
  end

  def create
    group = RaidGroup.new(allowed_params)
    group.guild_id = current_user.guild.id
    if group.save!
      redirect_to dashboard_path
    else
      redirect_to new_raid_group_path
    end
  end

  def destroy
    group = RaidGroup.find(params[:id])
    group.destroy
    redirect_to dashboard_path
  end

  private

  def allowed_params
    params.require(:raid_group).permit(:group_name)
  end
end
