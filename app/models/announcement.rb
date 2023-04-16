class Announcement < ApplicationRecord

  validates :announcement_title, length: {minimum: 1, maximum: 1024}, presence: true
  validates :announcement_body, length: {minimum: 1, maximum: 8192}, presence: true
  validates :announcement_status, length: {minimum: 3, maximum: 5},presence: true

  belongs_to :user
end