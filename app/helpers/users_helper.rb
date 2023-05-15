module UsersHelper
  def student_status_options
    %w[Open Ongoing Completed Terminated Other]
  end

  def user_status_options
    %w[Pending Active Inactive]
  end
end
