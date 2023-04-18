class Announcement < ApplicationRecord

  scope :announcement_guests, ->{ where(announcement_status: "ACT") }

  validates :announcement_id, length: { is: 12 }, presence: true, uniqueness: true
  validates :announcement_title, length: {minimum: 1, maximum: 1024}, presence: true
  validates :announcement_body, length: {minimum: 1, maximum: 16384}, presence: true
  validates :announcement_status, length: {minimum: 3, maximum: 5},presence: true
  validates :author_id, length: { minimum: 6, maximum: 10 }, presence: true

  # Error logging
  after_validation :log_errors, :if => Proc.new{ |m| m.errors }
  def log_errors
    Rails.logger.debug self.errors.full_messages.join("\n")
  end

  belongs_to :user, foreign_key: :author_id
end