class Event < ApplicationRecord
  validates :event_date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :rsvps, foreign_key: :attended_event_id
  has_many :attendees, through: :rsvps, source: :attendee

  scope :past, -> { where('event_date < ?', Date.today).order(event_date: :desc) }
  scope :future, -> { where('event_date > ?', Date.today).order(event_date: :asc) }
end
