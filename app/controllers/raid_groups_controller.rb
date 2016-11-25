class RaidGroupsController < ApplicationController
  before_filter :find_group, except: [:new, :create, :remove_member]
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
    @members = @group.guild_members.sort {|a,b| b.items["averageItemLevelEquipped"] <=> a.items["averageItemLevelEquipped"]}
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

  def remove_member
    session[:return_to] ||= request.referer
    member = RaidMember.find_by(guild_member_id: params[:member_id], raid_group_id: params[:group_id])
    member.delete
    redirect_to session.delete(:return_to)
  end

  private

  def find_group
    @group = RaidGroup.find(params[:id])
  end

  def allowed_params
    params.require(:raid_group).permit(:group_name)
  end
end
