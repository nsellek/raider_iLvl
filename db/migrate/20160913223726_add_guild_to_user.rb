class AddGuildToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :guild, foreign_key: true
  end
end
