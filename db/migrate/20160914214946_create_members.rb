class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :realm
      t.integer :iLvl
      t.string :spec
      t.references :raid_group

      t.timestamps
    end
  end
end
