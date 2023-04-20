class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.string :batch_name
      t.string :batch_status

      t.timestamps
    end
  end
end
