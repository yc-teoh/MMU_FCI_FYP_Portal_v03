class ProjectIndustryCollabColumnChanges < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :industry_collab_details, :industry_collab_company
    add_column :projects, :industry_collab_contact_name, :string
    add_column :projects, :industry_collab_contact_number, :string
  end
end
