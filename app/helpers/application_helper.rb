module ApplicationHelper
  def errmsg_no_permission_to_access
    "Sorry but you do not have the permission to access this feature."
  end

  def errmsg_presentation_id_exists
    "A presentation slot has been booked with this project title. Change of placement is no longer allowed at this point."
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

  def specialisation_options
    ["BCS-SE", "BIT", "BCS-DS", "BCS-GD", "BCS-CY", "BCS-AI", "DIP-IT"]
  end

  def project_status_options
    ["Vacant", "Active", "Completed", "Cancelled"]
  end

  def project_approval_options
    ["Pending", "Confirmed", "Rejected"]
  end

  def r_as
    "<span class=\"txt-red\">* </span>".html_safe
  end
end
