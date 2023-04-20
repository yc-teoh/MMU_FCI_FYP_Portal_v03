class FkAdjustmentsForBatchAndProjects < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :projects, :batches, column: :batch_id, primary_key: :batch_id
    add_foreign_key :projects, :users, column: :supervisor_id, primary_key: :user_id
    add_foreign_key :projects, :users, column: :co_supervisor_id, primary_key: :user_id
    add_foreign_key :projects, :users, column: :moderator_id, primary_key: :user_id
    add_foreign_key :projects, :users, column: :student_one_user_id, primary_key: :user_id
    add_foreign_key :projects, :users, column: :student_two_user_id, primary_key: :user_id
  end
end
