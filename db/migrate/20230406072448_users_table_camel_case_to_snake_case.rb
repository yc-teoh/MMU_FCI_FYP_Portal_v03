class UsersTableCamelCaseToSnakeCase < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :userID, :user_id
    rename_column :users, :userEmailAddress, :user_email_address
    rename_column :users, :userName, :user_name
    rename_column :users, :userGovID, :user_gov_id
    rename_column :users, :userGender, :user_gender
    rename_column :users, :userRole, :user_role
    rename_column :users, :userContactNo, :user_contact_no
    rename_column :users, :userStatus, :user_status
    rename_column :users, :studentBatch, :student_batch
    rename_column :users, :studentSpecialisation, :student_specialisation
    rename_column :users, :studentStatus, :student_status
    rename_column :users, :projectProgressID, :project_progress_id
    rename_column :users, :batchID, :batch_id
  end
end
