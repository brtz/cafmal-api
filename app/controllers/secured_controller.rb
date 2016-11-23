class SecuredController < ApplicationController
  before_action :authenticate_user

  def new
    classname = "#{params[:controller]}".singularize.camelize.constantize
    render json: classname.attribute_names.map {|n| [n.to_sym,classname.type_for_attribute(n).type]}.to_h
  end
end
