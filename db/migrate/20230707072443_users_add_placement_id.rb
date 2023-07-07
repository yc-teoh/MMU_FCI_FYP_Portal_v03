class UsersAddPlacementId < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :placement_id, :string
  end
end
