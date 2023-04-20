class AddProjectColumns < ActiveRecord::Migration[7.0]
  def change
    # Change the column name of the pre-generated columns.
    rename_column :projects, :id, :project_id
    rename_column :projects, :title, :project_title

    # Add new columns based on the documentations.
    add_column :projects, :project_approval_status, :string
    add_column :projects, :project_proposal_party, :string
    add_column :projects, :project_type, :string
    add_column :projects, :project_category, :string
    add_column :projects, :project_focus, :string
    add_column :projects, :project_date, :date
    add_column :projects, :project_other_specialisations, :string
    add_column :projects, :project_description, :string
    add_column :projects, :project_objective, :string
    add_column :projects, :project_scope, :string
    add_column :projects, :project_status, :string
    add_column :projects, :project_specialisation, :string
    add_column :projects, :project_background, :string
    add_column :projects, :project_outcomes, :string
    add_column :projects, :project_doc_id, :string
    add_column :projects, :supervisor_id, :string
    add_column :projects, :co_supervisor_id, :string
    add_column :projects, :moderator_id, :string
    add_column :projects, :reviewed_by, :string
    add_column :projects, :student_one_user_id, :string
    add_column :projects, :student_one_subtitle, :string
    add_column :projects, :student_one_work_distribution, :string
    add_column :projects, :student_two_user_id, :string
    add_column :projects, :student_two_subtitle, :string
    add_column :projects, :student_two_work_distribution, :string
    add_column :projects, :is_industry_collab, :string
    add_column :projects, :industry_collab_details, :string
    add_column :projects, :batch_id, :string
    add_column :projects, :remarks_project, :string
    add_column :projects, :remarks_supervisor, :string

    # Disable auto-increment for `project_id` column.
    change_column :projects, :project_id, :bigint, autoincrement: false

    # Change type of `project_id`(primary key)
    change_column :projects, :project_id, :string

    # Assign NOT NULL for specific columns.
    change_column_null :projects, :project_approval_status, false
    change_column_null :projects, :project_proposal_party, false
    change_column_null :projects, :project_type, false
    change_column_null :projects, :project_category, false
    change_column_null :projects, :project_focus, false
    change_column_null :projects, :project_title, false
    change_column_null :projects, :project_description, false
    change_column_null :projects, :project_objective, false
    change_column_null :projects, :project_scope, false
    change_column_null :projects, :project_status, false
    change_column_null :projects, :project_specialisation, false
    change_column_null :projects, :project_background, false
    change_column_null :projects, :project_outcomes, false
    change_column_null :projects, :supervisor_id, false
    change_column_null :projects, :is_industry_collab, false
    change_column_null :projects, :batch_id, false

  end
end
