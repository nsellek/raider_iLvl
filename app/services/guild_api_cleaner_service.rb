class GuildApiCleanerService

  def self.clean(response, current_user)
    response.each do |member|
      add_thumbnail_path(member)
      AddGuildMembersService.add_member(member["character"], current_user) if member["character"]["level"] >= 110
    end
    # GuildSpecFinderService.find_and_add_spec(characters)
  end

  def self.add_thumbnail_path(member)
    member["character"]["thumbnail"] = "http://us.battle.net/static-render/us/#{member["character"]["thumbnail"]}"
  end
end
