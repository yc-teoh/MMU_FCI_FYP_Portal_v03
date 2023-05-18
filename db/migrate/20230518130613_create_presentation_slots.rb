class CreatePresentationSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :presentation_slots do |t|
      t.string :user_id

      t.timestamps
    end
  end
end
