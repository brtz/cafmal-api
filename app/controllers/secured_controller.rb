class SecuredController < ApplicationController
  before_action :authenticate_user

  def new
    classname = "#{params[:controller]}".singularize.camelize.constantize
    fields = classname.attribute_names.map {|n| [n.to_sym,classname.type_for_attribute(n).type]}.to_h
    fields = fields.except(:id, :created_at, :updated_at, :deleted_at)

    render json: fields
  end
end
