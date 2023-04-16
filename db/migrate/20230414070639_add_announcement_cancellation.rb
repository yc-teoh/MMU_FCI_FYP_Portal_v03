class AddAnnouncementCancellation < ActiveRecord::Migration[7.0]
  def change
    # Add column of Announcements to indicate post removal.
    add_column :announcements, :announcement_status, :string

    # (optional) add a default value into the column above.
    change_column_default :announcements, :announcement_status, from: nil, to: "ACT"

    # Add NOT NULL status of the column above.
    change_column_null :announcements, :announcement_status, false
  end
end
