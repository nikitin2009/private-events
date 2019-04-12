class Event < ApplicationRecord
  has_many :attendances, foreign_key: "attended_event_id"
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :attendances, source: :attendee

  has_many :invitations
  has_many :invited_users, through: :invitations, source: :receiver

  scope :upcoming, -> { where("date > ?", Time.now) }
  scope :previous, -> { where("date < ?", Time.now) }


  def can_invite?(user)
    self.attendees.exclude?(user) && self.invited_users.exclude?(user) && self.creator != user
  end

end

