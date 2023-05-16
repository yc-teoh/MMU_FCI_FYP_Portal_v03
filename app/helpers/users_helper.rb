module UsersHelper
  def student_status_options
    %w[Open Ongoing Completed Terminated Other]
  end

  def user_status_options
    %w[Pending Active Inactive]
  end

  def assign_moderator_options
    # am = User.where(:user_role => %w[Coordinator Manager Moderator Supervisor]).pluck(:user_name, :user_id).append(["Moderator"])
    original_role = User.where()
    am = [original_role.user_role]
    return am
  end
end
