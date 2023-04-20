class AddBatchesColumn < ActiveRecord::Migration[7.0]
  def change
    # Change the column name of the pre-generated columns.
    rename_column :batches, :id, :batch_id

    # Disable auto-increment for `batch_id` column.
    change_column :batches, :batch_id, :bigint, autoincrement: false

    # Change type of `project_id`(primary key)
    change_column :batches, :batch_id, :string

    # Assign NOT NULL for specific columns.
    change_column_null :batches, :batch_name, false
    change_column_null :batches, :batch_status, false
  end
end
