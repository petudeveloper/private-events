class Event < ApplicationRecord
  has_many :event_invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :event_invitations, source: :attendee
  belongs_to :user, class_name: "User"
end
