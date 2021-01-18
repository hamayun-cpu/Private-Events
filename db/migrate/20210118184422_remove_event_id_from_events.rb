class RemoveEventIdFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :event_id
  end
end
