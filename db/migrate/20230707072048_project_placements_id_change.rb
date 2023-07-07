class ProjectPlacementsIdChange < ActiveRecord::Migration[7.0]
  def change
    remove_column :project_placements, :placement_id

    rename_column :project_placements, :id, :placement_id
    change_column :project_placements, :placement_id, :bigint, autoincrement: false
    change_column :project_placements, :placement_id, :string
  end
end
