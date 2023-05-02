class RemoveFkConstraintForCoSupervisorInProjectsTable < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :projects, column: :co_supervisor_id
  end
end
