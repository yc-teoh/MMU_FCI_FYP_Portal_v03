module PresentationSlotsHelper
  def param_options
    b = PresentationParam.pluck(:param_name, :param_id)
  end

  def placement_options
    p = ProjectPlacement.pluck(:project_id, :placement_id)
  end
end
