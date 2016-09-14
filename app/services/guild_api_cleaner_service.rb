class GuildApiCleanerService

  def self.clean(response)
    characters = []
    response.each do |member|
      characters << member["character"] if member["character"]["spec"]
    end
    characters
  end
end
