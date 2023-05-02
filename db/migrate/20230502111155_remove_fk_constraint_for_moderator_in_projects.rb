class RemoveFkConstraintForModeratorInProjects < ActiveRecord::Migration[7.0]
  def change
    # Revoke NOT NULL
    change_column_null :projects, :moderator_id, true

    # Remove foreign key
    remove_foreign_key :projects, column: :moderator_id
  end
end
