class SecuredController < ApplicationController
  before_action :authenticate_user

  def new
    classname = "#{params[:controller]}".singularize.camelize.constantize

    fields = {}
    classname.attribute_names.map.each do |name|
      attribute = nil
      if classname.type_for_attribute(name).type.nil?
        attribute = classname.send(name.pluralize)
      else
        attribute = classname.type_for_attribute(name).type
      end
      fields[name.to_sym] = attribute
    end

    fields = fields.except(:id, :created_at, :updated_at, :deleted_at)

    render json: fields
  end
end
