class User < ApplicationRecord
  has_many :attendances, foreign_key: 'user_id', class_name: 'Attendance'
  has_many :events, through: :attendances
  has_many :own_events, foreign_key: 'creator_id', class_name: 'Event'
end
