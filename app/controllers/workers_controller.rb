class WorkersController < SecuredController
  before_action :set_worker, only: [:show, :update, :destroy]

  # GET /workers
  def index
    authorize! :read, Worker
    @workers = Worker.all

    render json: @workers
  end

  # GET /workers/1
  def show
    authorize! :read, Worker
    render json: @worker
  end

  # POST /workers
  def create
    authorize! :create, Worker
    @worker = Worker.new(worker_params)

    if @worker.save
      render json: @worker, status: :created, location: @worker
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workers/1
  def update
    authorize! :update, Worker
    if @worker.update(worker_params)
      render json: @worker
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workers/1
  def destroy
    authorize! :destroy, Worker
    @worker.update_attributes(deleted_at: Time.now, uuid: 'deleted-' + @worker.uuid)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def worker_params
      params.require(:worker).permit(:uuid, :supported_sourcetype, :heartbeat_received_at)
    end
end
