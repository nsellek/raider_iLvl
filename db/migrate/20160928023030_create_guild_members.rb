class CreateGuildMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :guild_members do |t|
      t.string :name
      t.string :realm
      t.references :guild, foreign_key: true

      t.timestamps
    end
  end
end
