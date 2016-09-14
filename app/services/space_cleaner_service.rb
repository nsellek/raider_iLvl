class SpaceCleanerService

  def self.clean(string)
    string.gsub(' ', '%20')
  end
end
