module PresentationParamsHelper
  def param_status_options
    %w[Active Inactive]
  end

  def presentation_type_options
      [["Interim (FYP1)", "INT"], ["Poster (FYP 2)", "POS"]]
  end

  def presentation_venue_options
    %w[CQCR7001 CQCR7002 CQCR7003]
  end

  def presentation_time_slot_options
    %w[09:00 09:30 10:00 10:30 11:00 11:30]
  end
end
