class PresentationParam < ApplicationRecord

  validates :param_id, length: { is: 4 }, numericality: { only_integer: true }, presence: true, uniqueness: true
  validates :batch_id, length: { is: 6 }, presence: true
  validates :param_name, length: { minimum: 1, maximum: 64 }, presence: true
  validates :param_status, length: { minimum: 1, maximum: 32 }, presence: true
  validates :presentation_type, length: { is: 3 }, presence: true
  validates :presentation_venue, length: { maximum: 1024 }, presence: true
  validates :presentation_time_slots, length: { maximum: 1024 }, presence: true
  validates :presentation_date_start, presence: true
  validates :presentation_date_end, presence: true

  # Rails 7.X comparator.
  validates_comparison_of :presentation_date_end, greater_than_or_equal_to: :presentation_date_start

  after_validation :log_errors, :if => Proc.new{ |m| m.errors }
  def log_errors
    Rails.logger.debug self.errors.full_messages.join("\n\n ")
  end

end
