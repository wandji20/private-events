class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, class_name: 'User', :through => :attendances
end
