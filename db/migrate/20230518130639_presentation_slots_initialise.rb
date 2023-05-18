class PresentationSlotsInitialise < ActiveRecord::Migration[7.0]
  def change
    rename_column :presentation_slots, :id, :presentation_id
    change_column :presentation_slots, :presentation_id, :bigint, autoincrement: false
    change_column :presentation_slots, :presentation_id, :string

    add_column :presentation_slots, :presentation_date, :date
    add_column :presentation_slots, :presentation_location, :string
    add_column :presentation_slots, :supervisor_id, :string
    add_column :presentation_slots, :moderator_id, :string
    add_column :presentation_slots, :co_supervisor_id, :string
    add_column :presentation_slots, :project_id, :string
    add_column :presentation_slots, :other_attendees, :string
    add_column :presentation_slots, :presentation_remarks, :string
    add_column :presentation_slots, :presentation_score, :decimal
  end
end
