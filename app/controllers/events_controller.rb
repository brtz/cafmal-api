class EventsController < SecuredController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    authorize! :read, Event

    if params[:query].nil?

      if current_user.admin?
        @events = Event.limited_by_age
      else
        @events = Event.limited_by_team(current_user.team_id).limited_by_age
      end

    else
      query_age = Time.now.utc - event_params_filter[:age].to_i
      query_duration = Time.now.utc - (event_params_filter[:age].to_i - event_params_filter[:duration].to_i)

      if current_user.admin?
        @events = Event.where("created_at >= ? AND created_at <= ?", query_age, query_duration)
      else
        @events = Event.where("created_at >= ? AND created_at <= ? AND team_id = ?", query_age, query_duration, current_user.team_id)
      end

    end

    render json: @events
  end

  # GET /events/1
  def show
    authorize! :read, @event
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    authorize! :create,  @event

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize! :update,  @event
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    authorize! :destroy,  @event
    @event.update_attribute(:deleted_at, Time.now)
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

    def event_params_filter
      params.require(:query).permit(:age, :duration)
    end
end
