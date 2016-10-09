class AddColumnToGuildMember < ActiveRecord::Migration[5.0]
  def change
    add_column :guild_members, :ilvl, :string
  end
end
