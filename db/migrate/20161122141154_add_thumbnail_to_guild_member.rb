class AddThumbnailToGuildMember < ActiveRecord::Migration[5.0]
  def change
    add_column :guild_members, :thumbnail, :string
  end
end
