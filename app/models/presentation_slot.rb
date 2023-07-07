class PresentationSlot < ApplicationRecord
  validates :presentation_id, presence: true, uniqueness: true
  # validates :user_id, length: { minimum: 6, maximum: 10 }, presence: true, uniqueness: true
  # validates :presentation_location, length: { maximum: 32 }
  # validates :presentation_type, length: { is: 3 }
  # validates :supervisor_id, length: { minimum: 6, maximum: 10 }
  # validates :moderator_id, length: { minimum: 6, maximum: 10 }
  # validates :co_supervisor_id, length: { minimum: 6, maximum: 10 }
  # validates :project_id
  validates :other_attendees, length: { maximum: 512 }
  validates :presentation_remarks, length: { maximum: 2048 }
  # validates :presentation_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
