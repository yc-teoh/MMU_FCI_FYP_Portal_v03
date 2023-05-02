class Project < ApplicationRecord
  validates :project_id, presence: true, uniqueness: true
  validates :project_title, presence: true, uniqueness: true
  validates :supervisor_id, presence: true
  # validates :co_supervisor_id
  validates :project_type, presence: true

  # stud-info
  # TEMPORARILY HIDDEN DUE TO THE NO STUDENT VALIDATION CONSTRAINT.
  # validates :student_one_user_id, length: { minimum: 6, maximum: 10 }
  # validates :student_two_user_id, length: { minimum: 6, maximum: 10 }

  # industry-collab
  validates :is_industry_collab, length: { is: 1 }
  validates :industry_collab_company, length: { maximum: 64 }
  validates :industry_collab_contact_name, length: { maximum: 50 }
  validates :industry_collab_contact_number, length: { maximum: 20 }

  # proj-details-main
  validates :project_description, length: { maximum: 4096 }, presence: true
  validates :project_objective, length: { maximum: 4096 }, presence: true
  validates :project_scope, length: { maximum: 4096 }, presence: true

  after_validation :log_errors, :if => Proc.new{ |m| m.errors }
  def log_errors
    Rails.logger.debug self.errors.full_messages.join("\n\n")
  end

  belongs_to :user, class_name: "User", foreign_key: :supervisor_id, optional: true
end
