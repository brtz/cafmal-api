# encoding: UTF-8
# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Knock::Authenticable

  def index
    render json: { IAm: 'cafmal-api', Version: CAFMAL_API_VERSION, Pubkey: Knock.token_public_key.to_pem }
  end

  rescue_from 'AccessGranted::AccessDenied' do
    render json: { IAm: 'cafmal-api', Version: CAFMAL_API_VERSION, Message: 'Authorization denied' }, status: 403
  end
end
