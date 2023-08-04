class PslotsChangeStudTwoIdToParamId < ActiveRecord::Migration[7.0]
  def change
    rename_column :presentation_slots, :student_two_id, :param_id
  end
end
