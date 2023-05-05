module ProjectsHelper
  def batch_options
    b = Batch.pluck(:batch_name, :batch_id)
    return b
  end

  def co_supervisor_options
    cs = User.where(:user_role => %w[Coordinator Manager Moderator Supervisor]).pluck(:user_name, :user_id).append(["-"])
    return cs
  end

  def supervisor_options
    sp = User.where(:user_role =>  %w[Coordinator Manager Moderator Supervisor]).pluck(:user_name, :user_id)
  end
end
