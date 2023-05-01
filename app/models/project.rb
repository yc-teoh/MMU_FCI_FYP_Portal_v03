class Project < ApplicationRecord
  validates :project_id, presence: true, uniqueness: true
  validates :project_title, presence: true, uniqueness: true
  validates :supervisor_id, presence: true
  # validates :co_supervisor_id
  validates :project_type, presence: true

  # stud-info
  validates :student_one_user_id, length: { minimum: 6, maximum: 10 }, uniqueness: true
  validates :student_two_user_id, length: { minimum: 6, maximum: 10 }, uniqueness: true

  # industry-collab
  validates :is_industry_collab, length: { is: 1 }
  validates :industry_collab_company, length: { maximum: 64 }
  validates :industry_collab_contact_name, length: { minimum: 2, maximum: 50 }
  validates :industry_collab_contact_number, length: { minimum: 9, maximum: 20 }, numericality: { only_integer: true }

  # proj-details-main
  validates :project_description, length: { maximum: 4096 }, presence: true
  validates :project_objective, length: { maximum: 4096 }, presence: true
  validates :project_scope, length: { maximum: 4096 }, presence: true

  belongs_to :user, class_name: "User", foreign_key: :supervisor_id
end
