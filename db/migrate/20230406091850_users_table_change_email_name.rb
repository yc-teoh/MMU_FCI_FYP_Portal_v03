class UsersTableChangeEmailName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :user_email_address, :email
  end
end
