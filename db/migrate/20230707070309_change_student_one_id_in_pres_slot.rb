class ChangeStudentOneIdInPresSlot < ActiveRecord::Migration[7.0]
  def change
    rename_column :presentation_slots, :user_id, :student_one_id
  end
end
