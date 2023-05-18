class UserAddIsSupervisorColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_supervisor, :string
  end
end
