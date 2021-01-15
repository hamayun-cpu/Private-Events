class DromCreatortIdfromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :creator_id
  end
end
