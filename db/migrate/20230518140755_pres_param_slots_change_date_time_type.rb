class PresParamSlotsChangeDateTimeType < ActiveRecord::Migration[7.0]
  def change
    change_column :presentation_params, :presentation_date_start, :datetime
    change_column :presentation_params, :presentation_date_end, :datetime

    change_column :presentation_slots, :presentation_date, :datetime
  end
end
