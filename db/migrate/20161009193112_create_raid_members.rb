class CreateRaidMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :raid_members do |t|
      t.references :guild_member, foreign_key: true
      t.references :raid_group, foreign_key: true

      t.timestamps
    end
  end
end
