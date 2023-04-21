module ApplicationHelper
  def errmsg_no_permission_to_access
    return "Sorry but you do not have the permission to access this feature."
  end

  def user_gender_options
    [["Male", "M"], ["Female", "F"]]
  end

  def yes_no_options
    [["Yes", "Y"], ["No", "N"]]
  end

  def project_type_options
    [["Application-based Project", "APP"], ["Research-based Project", "RSC"]]
  end
end
