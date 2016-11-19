class ApplicationController < ActionController::API
  include Knock::Authenticable

  def index
    render json: "{\"IAm\":\"camfal-api\", \"version\":\"#{CAFMAL_API_VERSION}\"}"
  end
end
