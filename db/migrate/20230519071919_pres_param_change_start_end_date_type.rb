class PresParamChangeStartEndDateType < ActiveRecord::Migration[7.0]
  def change
    change_column :presentation_params, :presentation_date_start, :date
    change_column :presentation_params, :presentation_date_end, :date
  end
end
