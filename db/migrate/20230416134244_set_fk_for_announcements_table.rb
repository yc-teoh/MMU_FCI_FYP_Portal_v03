class SetFkForAnnouncementsTable < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :announcements, :users, column: :author_id, primary_key: :user_id
  end
end
