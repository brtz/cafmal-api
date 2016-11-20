class EventsController < SecuredController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    authorize! :read, Event
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    authorize! :read, Event
    render json: @event
  end

  # POST /events
  def create
    authorize! :create, Event
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize! :update, Event
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    authorize! :destroy, Event
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :message, :kind, :severity, :team_id)
    end
end
