class User < ApplicationRecord
  has_many :attendances, foreign_key: "attendee_id"
  has_many :events, foreign_key: "creator_id"
  has_many :attended_events, through: :attendances, source: :attended_event

  has_many :sent_invitations, class_name: "Invitation", foreign_key: :sender_id
  has_many :received_invitations, class_name: "Invitation", foreign_key: :receiver_id

  def upcoming_events
    self.attended_events.upcoming
  end

  def previous_events
    self.attended_events.previous
  end

  def can_invited_to?(event)
    event.attendees.exclude?(self) && event.invited_users.exclude?(self)
  end
end
