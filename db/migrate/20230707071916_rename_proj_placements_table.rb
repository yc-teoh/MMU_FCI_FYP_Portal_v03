class RenameProjPlacementsTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :proj_placement_tables, :project_placements
  end
end
