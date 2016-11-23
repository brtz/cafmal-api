class SecuredController < ApplicationController
  before_action :authenticate_user

  def new
    render json: "#{params[:controller]}".singularize.camelize.constantize.column_names
  end
end
