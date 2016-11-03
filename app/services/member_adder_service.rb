class MemberAdderService
  def self.add_members(members, group)
    members.each do |member_id|
      member = GuildMember.find(member_id)
      RaidMember.create!(guild_member_id: member.id, raid_group_id: group.id)
      if member.ilvl.nil?
        GetAndUpdateMemberService.get_member(member)
      end
    end
  end
end
