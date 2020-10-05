class Event < ApplicationRecord
  has_many :events
  has_many :attendees, foreign_key: 'id', class_name: 'User'
  belongs_to :creator, class_name: 'User'
  validates :title, :body, presence: true, length: { minimum: 3 }
  scope :today, -> { where('date == ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }
  scope :previous, -> { where('date < ?', Date.today) }
end
