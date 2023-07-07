class AddPlacementIdInPresSlots < ActiveRecord::Migration[7.0]
  def change
    add_column :presentation_slots, :placement_id, :string
  end
end
