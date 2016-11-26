class AlertersController < SecuredController
  before_action :set_alerter, only: [:show, :update, :destroy]

  # GET /alerters
  def index
    authorize! :read, Alerter
    @alerters = Alerter.all

    render json: @alerters
  end

  # GET /alerters/1
  def show
    authorize! :read, @alerter
    render json: @alerter
  end

  # POST /alerters
  def create
    @alerter = Alerter.new(alerter_params)
    authorize! :create, @alerter

    if @alerter.save
      render json: @alerter, status: :created, location: @alerter
    else
      render json: @alerter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alerters/1
  def update
    authorize! :update, @alerter
    if @alerter.update(alerter_params)
      render json: @alerter
    else
      render json: @alerter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alerters/1
  def destroy
    authorize! :destroy, @alerter
    @alerter.update_attributes(deleted_at: Time.now, uuid: 'deleted-' + @alerter.uuid)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alerter
      @alerter = Alerter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alerter_params
      params.require(:alerter).permit(:uuid, :supported_targets, :heartbeat_received_at)
    end
end
