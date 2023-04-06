# 2023_04_06
class UpdateUserTable < ActiveRecord::Migration[7.0]
  def change
    # Change the column name from the pre-generated names to the documented ones.
    rename_column :users, :id,  :userID
    rename_column :users, :email, :userEmailAddress

    # Add new columns based on the documentations.
    add_column :users, :userName, :string
    add_column :users, :userGovID, :string
    add_column :users, :userGender, :string
    add_column :users, :userRole, :string
    add_column :users, :userContactNo, :string
    add_column :users, :userStatus, :string
    add_column :users, :studentBatch, :integer
    add_column :users, :studentSpecialisation, :string
    add_column :users, :studentStatus, :string
    add_column :users, :projectProgressID, :integer
    add_column :users, :batchID, :bigint

    # Set NOT NULL for specific columns.
    change_column_null :users, :userName, false
    change_column_null :users, :userGovID, false
    change_column_null :users, :userGender, false
    change_column_null :users, :userRole, false
    change_column_null :users, :userContactNo, false
    change_column_null :users, :userStatus, false
  end
end
