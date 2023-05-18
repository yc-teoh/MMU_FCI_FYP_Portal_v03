class PresentationParam < ApplicationRecord
  validates :param_id, length: { is: 4 }, numericality: { only_integer: true }, presence: true, uniqueness: true
  validates :batch_id, length: { is: 6 }
  validates :param_name, length: { minimum: 1, maximum: 64 }, presence: true
  validates :param_status, length: { minimum: 1, maximum: 32 }, presence: true
  validates :presentation_type, length: { is: 3 }
  validates :presentation_venue, length: { maximum: 1024 }
  validates :presentation_time_slots, length: { maximum: 1024 }
end
