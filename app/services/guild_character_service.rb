class GuildCharacterService

  def self.guild_roster(guild, current_user)
    realm = SpaceCleanerService.clean(guild.realm)
    guild_name = SpaceCleanerService.clean(guild.guild_name)
    GuildApiCleanerService.clean(get_characters(realm, guild_name), current_user)
  end

  def self.get_characters(realm, guild_name)
    HTTParty.get("https://us.api.battle.net/wow/guild/#{realm}/#{guild_name}?fields=members&locale=en_US&apikey=#{ENV["guild_raider_key"]}")["members"]
  end
end
