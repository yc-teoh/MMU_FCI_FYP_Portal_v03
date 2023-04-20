class Project < ApplicationRecord

  belongs_to :user, class_name: "User", foreign_key: :supervisor_id
end
