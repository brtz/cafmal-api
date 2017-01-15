# encoding: UTF-8
# frozen_string_literal: true

class ChecksController < SecuredController
  before_action :set_check, only: [:show, :update, :destroy]

  # GET /checks
  def index
    if current_user.admin? || current_user.worker?
      @checks = Check.all
    else
      @checks = Check.limited_by_team(current_user.team_id)
    end

    render json: @checks
  end

  # GET /checks/1
  def show
    authorize! :read, @check
    render json: @check
  end

  # POST /checks
  def create
    @check = Check.new(check_params)
    authorize! :create, @check

    if @check.save
      render json: @check, status: :created, location: @check
    else
      render json: @check.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /checks/1
  def update
    authorize! :update, @check
    if @check.update(check_params)
      render json: @check
    else
      render json: @check.errors, status: :unprocessable_entity
    end
  end

  # DELETE /checks/1
  def destroy
    authorize! :destroy, @check
    @check.update_attribute(:deleted_at, Time.now)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_check
    @check = Check.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def check_params
    params.require(:check).permit(:category, :name, :condition_query, :condition_operator, :condition_aggregator, :condition_value, :severity, :interval, :is_locked, :team_id, :datasource_id, :documentation_url, :index)
  end
end
