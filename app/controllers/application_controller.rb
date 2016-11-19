class ApplicationController < ActionController::API
  include Knock::Authenticable

  def index
    render json: {IAm: "camfal-api", version: CAFMAL_API_VERSION}
  end

  rescue_from "AccessGranted::AccessDenied" do |exception|
    render json: {IAm: "camfal-api", version: CAFMAL_API_VERSION, message: "Authorization denied"}, status: 403
  end
end
