class Event < ApplicationRecord
  has_many :events
  has_many :users, through: :attendances
  belongs_to :creator, class_name: 'User'
  validates :title, :body, presence: true, length: { minimum: 3 }
end
