class AddColumnToRaidGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :raid_groups, :user, foreign_key: true
  end
end
