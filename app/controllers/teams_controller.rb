class TeamsController < SecuredController
  before_action :set_team, only: [:show, :update, :destroy]

  # GET /teams
  def index
    authorize! :read, Team
    @teams = Team.all

    render json: @teams
  end

  # GET /teams/1
  def show
    authorize! :read, Team
    render json: @team
  end

  # POST /teams
  def create
    authorize! :create, Team
    @team = Team.new(team_params)

    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    authorize! :update, Team
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    authorize! :destroy, Team
    @team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:name)
    end
end
