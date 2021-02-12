require 'date'

class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, class_name: 'User', through: 'attendances'

  scope :upcoming_events, -> { where('date > ?', Date.today.to_s) }
  scope :previous_events, -> { where('date < ?', Date.today.to_s) }
  # scope :important, -> { where(is_important: true) }
end
