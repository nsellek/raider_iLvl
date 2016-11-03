class AverageIlvlFinderService
  def self.find_average(members)
    members_ilvl = []
    members.each do |member|
      members_ilvl << member.items["averageItemLevelEquipped"].to_i
    end
    members_ilvl.inject(:+)/members.length
  end
end
