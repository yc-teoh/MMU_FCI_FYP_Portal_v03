class Batch < ApplicationRecord

  validates :batch_id, length: { is: 6 }, numericality: { only_integer: true }, presence: true, uniqueness: true
  validates :batch_name, length: { minimum: 1, maximum: 32 }, presence: true, uniqueness: true
  validates :batch_status, length: { minimum: 1, maximum: 32 }, presence: true

  has_many :users
  has_many :projects
end
