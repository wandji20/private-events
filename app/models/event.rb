require 'date'

class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, class_name: 'User', through: 'attendances'

  scope :upcoming_events, -> { where('date > ?', Date.today) }
  scope :previous_events, -> { where('date < ?', Date.today) }
  validates :title, :date, presence: true
  validates :description,  length: {in: (7...101)}
end
