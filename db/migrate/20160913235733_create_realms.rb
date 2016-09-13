class CreateRealms < ActiveRecord::Migration[5.0]
  def change
    create_table :realms do |t|
      t.string :realm_name

      t.timestamps
    end
  end
end
