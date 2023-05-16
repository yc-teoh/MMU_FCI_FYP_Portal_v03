class BatchesController < ApplicationController
  def index
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @batches = Batch.all
    end
  end

  # ============================================================================================================== #
  def show
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @batch = Batch.find(params[:batch_id])
    end
  end

  # ============================================================================================================== #
  def new
    @batch = Batch.new
  end

  # ============================================================================================================== #
  def create
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @batch = Batch.new(batch_params)

      if @batch.save
        redirect_to @batch
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # ============================================================================================================== #
  private
  def batch_params
    params.require(:batch).permit(:batch_id, :batch_name, :batch_status)
  end
end
