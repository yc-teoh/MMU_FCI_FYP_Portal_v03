class UsersTableAssignDefaultValues < ActiveRecord::Migration[7.0]
  def change
    # Change default values of some columns.
    change_column_default :users, :user_role, "Undefined"
    change_column_default :users, :user_status, "Pending"

    # Add column of `userRemarks`
    add_column :users, :user_remarks, :string
  end
end
