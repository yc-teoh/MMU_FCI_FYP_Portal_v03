class BatchesController < ApplicationController
  def index
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @batches = Batch.all.order(batch_id: :desc)
    end
  end

  # ============================================================================================================== #
  def show
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @batch = Batch.find(params[:batch_id])
      @batch_students = User.where(user_role: "Student", batch_id: @batch.batch_id)
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
  def edit
    @batch = Batch.find(params[:batch_id])
  end

  # ============================================================================================================== #
  def update
    @batch = Batch.find(params[:batch_id])

    if @batch.update(batch_params)
      redirect_to @batch
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ============================================================================================================== #
  private
  def batch_params
    params.require(:batch).permit(:batch_id, :batch_name, :batch_status)
  end
end
