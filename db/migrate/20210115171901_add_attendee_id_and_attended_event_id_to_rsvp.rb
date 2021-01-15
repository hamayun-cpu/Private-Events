class AddAttendeeIdAndAttendedEventIdToRsvp < ActiveRecord::Migration[6.0]
  def change
    add_column :rsvps, :attendee_id, :integer
    add_column :rsvps, :attended_event_id, :integer
  end
end
