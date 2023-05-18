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

  def specialisation_options
    ["BCS-SE", "BIT", "BCS-DS", "BCS-GD", "BCS-CY", "BCS-AI", "DIP-IT"]
  end

  def project_status_options
    ["Vacant", "Active", "Completed", "Cancelled"]
  end

  def project_approval_options
    ["Pending", "Confirmed", "Rejected"]
  end

  def nyaoha
    "<img src='https://archives.bulbagarden.net/media/upload/thumb/e/e2/0906Sprigatito.png/240px-0906Sprigatito.png'
    alt='sprigatito' length='64px' width='64px' />"
  end
end
