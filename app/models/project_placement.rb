class ProjectPlacement < ApplicationRecord

  validates :project_id, presence: true
  validates :placement_id, presence: true, uniqueness: true

  attr_accessor :stud1
  attr_accessor :stud2

  belongs_to :project
end
