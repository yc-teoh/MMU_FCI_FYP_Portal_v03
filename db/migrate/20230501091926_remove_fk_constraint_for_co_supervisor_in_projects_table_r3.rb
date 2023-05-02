class RemoveFkConstraintForCoSupervisorInProjectsTableR3 < ActiveRecord::Migration[7.0]
  def change
    change_column_null :projects, :co_supervisor_id, true
    change_column_null :projects, :student_one_user_id, true
    change_column_null :projects, :student_two_user_id, true
  end
end
