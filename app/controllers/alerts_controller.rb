class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :update, :destroy]

  # GET /alerts
  def index
    authorize! :read, Alert
    @alerts = Alert.all

    render json: @alerts
  end

  # GET /alerts/1
  def show
    authorize! :read, Alert
    render json: @alert
  end

  # POST /alerts
  def create
    authorize! :create, Alert
    @alert = Alert.new(alert_params)

    if @alert.save
      render json: @alert, status: :created, location: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alerts/1
  def update
    authorize! :update, Alert
    if @alert.update(alert_params)
      render json: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alerts/1
  def destroy
    authorize! :destroy, Alert
    @alert.update_attribute(:deleted_at, Time.now)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alert_params
      params.require(:alert).permit(:cooldown, :alert_method, :alert_target, :is_active, :minimum_severity, :team_id)
    end
end
