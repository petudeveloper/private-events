class Event < ApplicationRecord
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :attendee
  belongs_to :creator, class_name: 'User'

  scope :past_events, -> { where('date < ?', DateTime.now) }
  scope :future_events, -> { where('date > ?', DateTime.now) }
end
