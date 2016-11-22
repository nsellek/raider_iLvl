require "open-uri"
class GetAndUpdateMemberService
  def self.get_member(member)
    response = HTTParty.get(URI::encode("https://us.api.battle.net/wow/character/#{member.realm}/#{member.name}?fields=items&locale=en_US&apikey=#{ENV["guild_raider_key"]}"))
    member.update(items: response["items"])
  end
end
