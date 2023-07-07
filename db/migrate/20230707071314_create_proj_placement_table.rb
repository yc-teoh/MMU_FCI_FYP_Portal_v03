class CreateProjPlacementTable < ActiveRecord::Migration[7.0]
  def change
    create_table :proj_placement_tables do |t|
      t.string :placement_id
      t.string :placement_status
      t.string :placement_batch
      t.string :project_id
      t.string :moderator_id
      t.string :presentation_id
      t.timestamps
    end

    add_column :projects, :placement_id, :string
  end
end
