class Batch < ApplicationRecord

  # Form validations
  validates :batch_id, length: { is: 6 }, numericality: { only_integer: true }, presence: true, uniqueness: true
  validates :batch_name, length: { minimum: 1, maximum: 32 }, presence: true, uniqueness: true
  validates :batch_status, length: { minimum: 1, maximum: 32 }, presence: true

  # Table relationships
  has_many :users
  has_many :projects
  has_many :project_placements
  has_many :presentation_params

  # Error logging
  after_validation :log_errors, :if => Proc.new{ |m| m.errors }
  def log_errors
    Rails.logger.debug self.errors.full_messages.join("\n")
  end
end
