class CreateRaidGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :raid_groups do |t|
      t.string :group_name
      t.integer :total_people
      t.integer :average_ilvl

      t.timestamps
    end
  end
end
