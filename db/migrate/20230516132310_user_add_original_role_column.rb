class UserAddOriginalRoleColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_role_original, :string
  end
end
