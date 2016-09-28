class RaidGroupsController < ApplicationController
  before_filter :find_group, only: [:destory, :show, :add_members]
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
    @group.destroy
    redirect_to dashboard_path
  end

  def show
  end

  def add_members
    @guild = current_user.guild
  end

  private

  def find_group
    @group = RaidGroup.find(params[:id])
  end

  def allowed_params
    params.require(:raid_group).permit(:group_name)
  end
end
