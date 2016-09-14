class AddGuildToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :guild_id, :integer
  end
end
