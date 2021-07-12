class Event < ApplicationRecord
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :attendee
  belongs_to :user, class_name: 'User'

=begin Separate the past and upcoming events on the Event’s Index page by creating two class methods on the Event model

  def self.past_events(user)
    user.attended_events.where('date < ?', DateTime.now)
  end

  def self.future_events(user)
    user.attended_events.where('date > ?', DateTime.now)
  end
=end
  
  scope :past_events, -> { where('date < ?', DateTime.now) }
  scope :future_events, -> { where('date > ?', DateTime.now) }
end
