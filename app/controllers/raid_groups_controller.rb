class RaidGroupsController < ApplicationController
  before_filter :find_group, except: [:new, :create]
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
    guild_members = @guild.guild_members
    @remaining_members = guild_members - @group.guild_members
  end

  def save_members
    members = params[:members]
    MemberAdderService.add_members(members, @group)
    redirect_to raid_group_path(@group)
  end

  def refresh_members
    members = @group.guild_members
    RaidMemberRefreshService.refresh_members(members)
    redirect_to raid_group_path(@group)
  end

  private

  def find_group
    @group = RaidGroup.find(params[:id])
  end

  def allowed_params
    params.require(:raid_group).permit(:group_name)
  end
end
