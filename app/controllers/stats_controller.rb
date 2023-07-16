class StatsController < ApplicationController
  def index
    # ------ Projects ------ #
    @projects = Project.all
    @projects_active = Project.where(:project_status => "Active")

    # BCS-SE
    @projects_bcsse = Project.where(:project_specialisation => "BCS-SE").order(project_id: :asc)
    @projects_bcsse_confirmed = @projects_bcsse.where(:project_approval_status => "Confirmed")
    @projects_bcsse_active = @projects_bcsse_confirmed.where(:project_status => "Active")
    @projects_bcsse_vacant = @projects_bcsse_confirmed.where(:project_status => "Vacant")
    @projects_bcsse_completed = @projects_bcsse_confirmed.where(:project_status => "Completed")
    @projects_bcsse_cancelled = @projects_bcsse_confirmed.where(:project_status => "Cancelled")

    # BCS-DS
    @projects_bcsds = Project.where(:project_specialisation => "BCS-DS").order(project_id: :asc)
    @projects_bcsds_confirmed = @projects_bcsds.where(:project_approval_status => "Confirmed")
    @projects_bcsds_active = @projects_bcsds_confirmed.where(:project_status => "Active")
    @projects_bcsds_vacant = @projects_bcsds_confirmed.where(:project_status => "Vacant")
    @projects_bcsds_completed = @projects_bcsds_confirmed.where(:project_status => "Completed")
    @projects_bcsds_cancelled = @projects_bcsds_confirmed.where(:project_status => "Cancelled")

    # BCS-GD
    @projects_bcsgd = Project.where(:project_specialisation => "BCS-GD").order(project_id: :asc)
    @projects_bcsgd_confirmed = @projects_bcsgd.where(:project_approval_status => "Confirmed")
    @projects_bcsgd_active = @projects_bcsgd_confirmed.where(:project_status => "Active")
    @projects_bcsgd_vacant = @projects_bcsgd_confirmed.where(:project_status => "Vacant")
    @projects_bcsgd_completed = @projects_bcsgd_confirmed.where(:project_status => "Completed")
    @projects_bcsgd_cancelled = @projects_bcsgd_confirmed.where(:project_status => "Cancelled")

    # BCS-AI
    @projects_bcsai = Project.where(:project_specialisation => "BCS-AI").order(project_id: :asc)
    @projects_bcsai_confirmed = @projects_bcsai.where(:project_approval_status => "Confirmed")
    @projects_bcsai_active = @projects_bcsai_confirmed.where(:project_status => "Active")
    @projects_bcsai_vacant = @projects_bcsai_confirmed.where(:project_status => "Vacant")
    @projects_bcsai_completed = @projects_bcsai_confirmed.where(:project_status => "Completed")
    @projects_bcsai_cancelled = @projects_bcsai_confirmed.where(:project_status => "Cancelled")

    # BCS-CY
    @projects_bcscy = Project.where(:project_specialisation => "BCS-CY").order(project_id: :asc)
    @projects_bcscy_confirmed = @projects_bcscy.where(:project_approval_status => "Confirmed")
    @projects_bcscy_active = @projects_bcscy_confirmed.where(:project_status => "Active")
    @projects_bcscy_vacant = @projects_bcscy_confirmed.where(:project_status => "Vacant")
    @projects_bcscy_completed = @projects_bcscy_confirmed.where(:project_status => "Completed")
    @projects_bcscy_cancelled = @projects_bcscy_confirmed.where(:project_status => "Cancelled")

    # BIT
    @projects_bit = Project.where(:project_specialisation => "BIT").order(project_id: :asc)
    @projects_bit_confirmed = @projects_bit.where(:project_approval_status => "Confirmed")
    @projects_bit_active = @projects_bit_confirmed.where(:project_status => "Active")
    @projects_bit_vacant = @projects_bit_confirmed.where(:project_status => "Vacant")
    @projects_bit_completed = @projects_bit_confirmed.where(:project_status => "Completed")
    @projects_bit_cancelled = @projects_bit_confirmed.where(:project_status => "Cancelled")

    # DIP-IT
    @projects_dipit = Project.where(:project_specialisation => "DIP-IT").order(project_id: :asc)
    @projects_dipit_confirmed = @projects_dipit.where(:project_approval_status => "Confirmed")
    @projects_dipit_active = @projects_dipit_confirmed.where(:project_status => "Active")
    @projects_dipit_vacant = @projects_dipit_confirmed.where(:project_status => "Vacant")
    @projects_dipit_completed = @projects_dipit_confirmed.where(:project_status => "Completed")
    @projects_dipit_cancelled = @projects_dipit_confirmed.where(:project_status => "Cancelled")
  end
end
