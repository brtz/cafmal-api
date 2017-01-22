# encoding: UTF-8
# frozen_string_literal: true

class AlertsController < SecuredController
  before_action :set_alert, only: [:show, :update, :destroy]

  # GET /alerts
  def index
    if current_user.admin? || current_user.alerter?
      @alerts = Alert.all
    else
      @alerts = Alert.limited_by_team(current_user.team_id)
    end

    render json: @alerts
  end

  # GET /alerts/1
  def show
    authorize! :read, @alert
    render json: @alert
  end

  # POST /alerts
  def create
    @alert = Alert.new(alert_params)
    authorize! :create, @alert

    if @alert.save
      render json: @alert, status: :created, location: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alerts/1
  def update
    authorize! :update, @alert
    if @alert.update(alert_params)
      render json: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alerts/1
  def destroy
    authorize! :destroy, @alert
    @alert.update_attribute(:deleted_at, Time.now)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_alert
    @alert = Alert.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def alert_params
    # we explicitly allow updated_at here, as alerters need to be able to modify it
    params.require(:alert).permit(:cooldown, :alert_method, :alert_target, :is_enabled, :minimum_severity, :team_id, :is_silenced, :pattern, :updated_at)
  end
end
