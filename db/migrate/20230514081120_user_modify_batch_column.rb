class UserModifyBatchColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :batch_id, :string
  end
end
