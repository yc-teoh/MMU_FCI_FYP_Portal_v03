class ProjectPlacementsController < ApplicationController

  def edit
    @project_placement = ProjectPlacement.find(params[:placement_id])
    @passed_project_id = $project_id_pass
    @passed_batch_id = Project.find_by_project_id(@passed_project_id).batch_id

    @presentation_id = @project_placement.presentation_id
  end

  def update
    if user_signed_in?
      curr_usr_role = current_user.user_role
      if curr_usr_role == "Coordinator"

        @project_placement = ProjectPlacement.find(params[:placement_id])

        def debugger
          @project_placement.errors.each {|err| puts err }
          puts "[DEBUG] Error is #{@project_placement.errors.to_s}"
        end

        # Find the student with the matching PLACEMENT ID.
        @before_alteration_studs = User.where(:placement_id => @project_placement.placement_id)

        # Obtain User IDs from existing records.
        if @before_alteration_studs.count == 2
          @stud1 = @before_alteration_studs.pluck[0][0].to_s
          @stud2 = @before_alteration_studs.pluck[1][0].to_s
        elsif @before_alteration_studs.count == 1
          @stud1 = @before_alteration_studs.pluck[0][0].to_s
          @stud2 = nil
        else
          @stud1 = nil
          @stud2 = nil
        end

        # Counter of input to determine the next step of operation.
        input_counter = 2

        if projplacement_params[:stud1].nil? || projplacement_params[:stud1] == "" || projplacement_params[:stud1] == "-"
          input_counter = input_counter - 1
        end

        if projplacement_params[:stud2].nil? || projplacement_params[:stud2] == "" || projplacement_params[:stud2] == "-"
          input_counter = input_counter - 1
        end

        # Reset all student columns to "-".
        before_alter_count = @before_alteration_studs.count
        if before_alter_count == 1
          @stud1_mod = User.find_by_user_id(@stud1)
          @stud1_mod.update(:placement_id => "-")
          unless @stud2 == nil
            @stud2_mod = User.find_by_user_id(@stud2)
            @stud2_mod.update(:placement_id => "-")
          end
        elsif before_alter_count == 2
          @stud1_mod = User.find_by_user_id(@stud1)
          @stud1_mod.update(:placement_id => "-")
          @stud2_mod = User.find_by_user_id(@stud2)
          @stud2_mod.update(:placement_id => "-")
        else
          unless @stud1 == nil
            @stud1_mod = User.find_by_user_id(@stud1)
            @stud1_mod.update(:placement_id => "-")
          end
          unless @stud2 == nil
            @stud2_mod = User.find_by_user_id(@stud2)
            @stud2_mod.update(:placement_id => "-")
          end
        end

        # Update the student columns with actual data.
        @after_alteration_studs = User.where(:placement_id => @project_placement.placement_id)

        if @after_alteration_studs.count == 0
          # Only Student 1
          if input_counter == 1
            @stud1_mod = User.find_by_user_id(projplacement_params[:stud1])
            @stud1_mod.update(:placement_id => $project_id_pass)

            # Both Student 1 and 2
          elsif input_counter == 2
            @stud1_mod = User.find_by_user_id(projplacement_params[:stud1])
            @stud2_mod = User.find_by_user_id(projplacement_params[:stud2])
            @stud1_mod.update(:placement_id => $project_id_pass)
            @stud2_mod.update(:placement_id => $project_id_pass)
          end
        end

        # The rest.
        if @project_placement.update(projplacement_params)
          redirect_to project_path($project_id_pass)
        else
          debugger
          render :edit, status: :unprocessable_entity
        end
      end

    end
  end

  private
  def projplacement_params
    params.require(:project_placement).permit(
      :placement_id, :placement_status, :placement_batch,
      :project_id, :moderator_id, :presentation_id,
      :stud1, :stud2
    )
  end

  def projplacement_user_params
    params.require(:user).permit(:user_id, :placement_id)
  end

  private
  def projplacement_project_params
    params.require(:project).permit(:project_id, :placement_id)
  end
end
