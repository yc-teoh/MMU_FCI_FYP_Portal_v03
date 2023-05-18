class CreatePresentationParams < ActiveRecord::Migration[7.0]
  def change
    create_table :presentation_params do |t|
      t.string :param_name
      t.string :param_status

      t.timestamps
    end
  end
end
