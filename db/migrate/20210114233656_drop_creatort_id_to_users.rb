class DropCreatortIdToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :creator_id
  end
end
