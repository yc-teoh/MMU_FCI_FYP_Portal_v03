class UserTableUpdateUserIdType < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :user_id, :string
  end
end
