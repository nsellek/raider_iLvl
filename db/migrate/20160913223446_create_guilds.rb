class CreateGuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :guilds do |t|
      t.string :guild_name
      t.string :realm
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
