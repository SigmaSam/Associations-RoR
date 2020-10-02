class Attendance < ApplicationRecord
  belongs_to :user, class_name: 'User', dependent: :destroy
  belongs_to :event, class_name: 'Event', dependent: :destroy
  validates :event_id, uniqueness: { scope: :user_id }
end
