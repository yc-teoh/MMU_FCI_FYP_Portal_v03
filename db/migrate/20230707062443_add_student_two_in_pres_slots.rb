class AddStudentTwoInPresSlots < ActiveRecord::Migration[7.0]
  def change
    add_column :presentation_slots, :student_two_id, :string
  end
end
