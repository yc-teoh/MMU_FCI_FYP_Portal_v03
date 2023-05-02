class RemoveFkConstraintForCoSupervisorInProjectsTableR2 < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :projects, column: :student_one_user_id
    remove_foreign_key :projects, column: :student_two_user_id
  end
end
