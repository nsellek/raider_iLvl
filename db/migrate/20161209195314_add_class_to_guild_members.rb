class AddClassToGuildMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :guild_members, :class_name, :string
  end
end
