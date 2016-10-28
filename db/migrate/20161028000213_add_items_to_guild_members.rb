class AddItemsToGuildMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :guild_members, :items, :json
  end
end
