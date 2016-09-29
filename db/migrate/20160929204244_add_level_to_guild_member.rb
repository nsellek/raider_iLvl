class AddLevelToGuildMember < ActiveRecord::Migration[5.0]
  def change
    add_column :guild_members, :level, :string
  end
end
