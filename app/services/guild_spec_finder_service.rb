require 'open-uri'

class GuildSpecFinderService
  class << self
    def find_and_add_spec(characters)
      characters.map do |character|
        character.has_key?("spec") ? character : add_spec(character)
      end
    end

    def add_spec(character)
      character["spec"] = get_spec(character)
    end

    def get_spec(character)
      name = SpaceCleanerService.clean(character["name"])
      realm = SpaceCleanerService.clean(character["realm"])
      toon = HTTParty.get(URI::encode("https://us.api.battle.net/wow/character/#{realm}/#{name}?fields=talents&locale=en_US&apikey=#{ENV["guild_raider_key"]}"))["talents"]
      extract_spec(toon)
    end

    def extract_spec(toon)
      toon.first["talents"].each do |talent|
        break talent["spec"] if talent.has_key?("spec")
      end
    end
  end
end
