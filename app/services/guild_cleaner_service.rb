class GuildCleanerService

  def self.clean(current_user)
    current_members = current_user.guild.guild_members
    current_members.each do |member|
      member.destroy if member.updated_at < Time.now - 5.minutes
    end
  end
end
