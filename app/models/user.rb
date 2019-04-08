class User < ApplicationRecord
  has_many :attendances, foreign_key: "attendee_id"
  has_many :events, foreign_key: "creator_id"
  has_many :attended_events, through: :attendances, source: :attended_event

  def upcoming_events
    self.attended_events.upcoming
  end

  def previous_events
    self.attended_events.previous
  end
end
