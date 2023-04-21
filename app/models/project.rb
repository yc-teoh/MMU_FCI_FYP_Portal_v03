class Project < ApplicationRecord
  validates :project_id, presence: true, uniqueness: true
  validates :project_title, presence: true, uniqueness: true
  validates :supervisor_id, presence: true
  # validates :co_supervisor_id
  validates :project_type, presence: true

  belongs_to :user, class_name: "User", foreign_key: :supervisor_id
end
