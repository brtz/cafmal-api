class ChecksController < SecuredController
  before_action :set_check, only: [:show, :update, :destroy]

  # GET /checks
  def index
    authorize! :read, Check
    @checks = Check.all

    render json: @checks
  end

  # GET /checks/1
  def show
    authorize! :read, Check
    render json: @check
  end

  # POST /checks
  def create
    authorize! :create, Check
    @check = Check.new(check_params)

    if @check.save
      render json: @check, status: :created, location: @check
    else
      render json: @check.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /checks/1
  def update
    authorize! :update, Check
    if @check.update(check_params)
      render json: @check
    else
      render json: @check.errors, status: :unprocessable_entity
    end
  end

  # DELETE /checks/1
  def destroy
    authorize! :destroy, Check
    @check.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check
      @check = Check.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def check_params
      params.require(:check).permit(:category, :name, :condition_query, :condition_operand, :condition_aggegrator, :severity, :interval, :is_locked, :last_ran_at, :team_id, :datasource_id)
    end
end
