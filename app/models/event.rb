class Event < ApplicationRecord
  has_many :attendances, foreign_key: "attended_event_id"
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :attendances, source: :attendee
end

