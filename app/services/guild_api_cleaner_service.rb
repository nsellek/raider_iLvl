class GuildApiCleanerService

  def self.clean(response)
    characters = []
    response.each do |member|
      add_thumbnail_path(member)
      characters << member["character"] if member["character"]["level"] >= 110
    end
    GuildSpecFinderService.find_and_add_spec(characters)
  end

  def self.add_thumbnail_path(member)
    member["character"]["thumbnail"] = "http://us.battle.net/static-render/us/#{member["character"]["thumbnail"]}"
  end
end
