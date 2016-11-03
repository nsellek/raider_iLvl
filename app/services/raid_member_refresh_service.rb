class RaidMemberRefreshService
  def self.refresh_members(members)
    members.each do |member|
      GetAndUpdateMemberService.get_member(member)
    end
  end
end
