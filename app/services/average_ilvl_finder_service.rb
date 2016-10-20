class AverageIlvlFinderService
  def self.find_average(members)
    average = 0
    members_ilvl = []
    members.each do |member|
      members_ilvl << member.ilvl.to_i
    end
    average = members_ilvl.inject(:+)/members.length
  end
end
