class DisableNotNullForColumnsInProjects < ActiveRecord::Migration[7.0]
  def change
    # Revoke NOT NULL from certain columns.
    change_column_null :projects, :project_background, true
    change_column_null :projects, :project_outcomes, true
    change_column_null :projects, :project_proposal_party, true
  end
end
