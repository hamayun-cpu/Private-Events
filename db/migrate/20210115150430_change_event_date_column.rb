class ChangeEventDateColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :event_date, :datetime
  end
end
