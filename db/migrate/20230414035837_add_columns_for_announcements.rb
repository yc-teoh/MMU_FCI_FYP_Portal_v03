class AddColumnsForAnnouncements < ActiveRecord::Migration[7.0]
  def change
    # Change the column name for the pre-generated names to the documented ones.
    rename_column :announcements, :id, :announcement_id
    rename_column :announcements, :title, :announcement_title
    rename_column :announcements, :body, :announcement_body

    # Add new columns based on the documentations.
    add_column :announcements, :author_id, :string
    add_column :announcements, :announcement_file_path, :string

    # Set NOT NULL for specific columns.
    change_column_null :announcements, :announcement_title, false
    change_column_null :announcements, :announcement_body, false
    change_column_null :announcements, :author_id, false

    # Disable auto-increment for `announcement_id` column.
    change_column :announcements, :announcement_id, :bigint, autoincrement: false

    # Change type of `announcement_id` (primary key)
    change_column :announcements, :announcement_id, :string

    # Change type of
  end
end
