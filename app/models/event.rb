class Event < ApplicationRecord
  has_many :events
  has_many :attendees, foreign_key: 'user_id', class_name: 'User'
  belongs_to :creator, class_name: 'User'
  validates :title, :body, presence: true, length: { minimum: 3 }
end
