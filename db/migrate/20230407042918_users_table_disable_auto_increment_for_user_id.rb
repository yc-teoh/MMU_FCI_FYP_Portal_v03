class UsersTableDisableAutoIncrementForUserId < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :user_id, :bigint, autoincrement: false
  end
end
