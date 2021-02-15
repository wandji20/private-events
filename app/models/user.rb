class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, class_name: 'Event', through: :attendances

  validates :userid, presence: true, uniqueness: true, length: { in: (4..11) }
  validates :username, presence: true, length: { in: (4..11) }, uniqueness: true
end
