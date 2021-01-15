class AddCreatortIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :creator_id, :integer
  end
end
