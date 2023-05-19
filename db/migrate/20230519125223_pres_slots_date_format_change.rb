class PresSlotsDateFormatChange < ActiveRecord::Migration[7.0]
  def change
    change_column :presentation_slots, :presentation_date, :date
    add_column :presentation_slots, :presentation_time, :string
  end
end
