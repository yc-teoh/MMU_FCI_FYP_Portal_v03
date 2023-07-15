class StatsController < ApplicationController
  def index
    # ------ Projects ------ #
    @projects = Project.all
    @projects_active = Project.where(:project_status => "Active")

    # BCS-SE
    @projects_bcsse = Project.where(:project_specialisation => "BCS-SE").order(project_id: :asc)
    @projects_bcsse_active = @projects_bcsse.where(:project_status => "Active")

    # BCS-DS
    @projects_bcsds = Project.where(:project_specialisation => "BCS-DS").order(project_id: :asc)
    @projects_bcsds_active = @projects_bcsds.where(:project_status => "Active")

    # BCS-GD
    @projects_bcsgd = Project.where(:project_specialisation => "BCS-GD").order(project_id: :asc)
    @projects_bcsgd_active = @projects_bcsgd.where(:project_status => "Active")

    # BCS-AI
    @projects_bcsai = Project.where(:project_specialisation => "BCS-AI").order(project_id: :asc)
    @projects_bcsai_active = @projects_bcsai.where(:project_status => "Active")

    # BCS-CY
    @projects_bcscy = Project.where(:project_specialisation => "BCS-CY").order(project_id: :asc)
    @projects_bcscy_active = @projects_bcscy.where(:project_status => "Active")

    # BIT
    @projects_bit = Project.where(:project_specialisation => "BIT").order(project_id: :asc)
    @projects_bit_active = @projects_bit.where(:project_status => "Active")

    # DIP-IT
    @projects_dipit = Project.where(:project_specialisation => "DIP-IT").order(project_id: :asc)
    @projects_dipit_active = @projects_dipit.where(:project_status => "Active")
  end
end
