class PresParamsInitialising < ActiveRecord::Migration[7.0]
  def change
    rename_column :presentation_params, :id, :param_id
    change_column :presentation_params, :param_id, :bigint, autoincrement: false
    change_column :presentation_params, :param_id, :string

    add_column :presentation_params, :batch_id, :string
    add_column :presentation_params, :presentation_type, :string
    add_column :presentation_params, :presentation_venue, :string
    add_column :presentation_params, :presentation_date_start, :date
    add_column :presentation_params, :presentation_date_end, :date
    add_column :presentation_params, :presentation_time_slots, :string
  end
end
