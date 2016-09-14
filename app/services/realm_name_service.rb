class RealmNameService
  def self.realm_name
    realms = []
    Realm.all.each do |realm|
      realms << realm.realm_name
    end
    realms
  end
end
