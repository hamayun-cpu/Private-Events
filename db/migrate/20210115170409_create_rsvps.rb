class CreateRsvps < ActiveRecord::Migration[6.0]
  def change
    create_table :rsvps do |t|

      t.timestamps
    end
  end
end
