class DatasourcesController < SecuredController
  before_action :set_datasource, only: [:show, :update, :destroy]

  # GET /datasources
  def index
    authorize! :read, Datasource
    @datasources = Datasource.all

    render json: @datasources
  end

  # GET /datasources/1
  def show
    authorize! :read, Datasource
    render json: @datasource
  end

  # POST /datasources
  def create
    authorize! :create, Datasource
    @datasource = Datasource.new(datasource_params)

    if @datasource.save
      render json: @datasource, status: :created, location: @datasource
    else
      render json: @datasource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /datasources/1
  def update
    authorize! :update, Datasource
    if @datasource.update(datasource_params)
      render json: @datasource
    else
      render json: @datasource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /datasources/1
  def destroy
    authorize! :destroy, Datasource
    @datasource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datasource
      @datasource = Datasource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def datasource_params
      params.require(:datasource).permit(:sourcetype, :address, :port, :protocol, :username, :password)
    end
end
