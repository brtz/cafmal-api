require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CafmalApi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.time_zone = 'UTC'
    config.active_record.default_timezone = :utc

    config.cache_store = :redis_store, {
      host: "redis" || ENV["CAFMAL-API_CACHE_HOST"],
      port: 6379 || ENV["CAFMAL-API_CACHE_PORT"].to_i,
      db: 0 || ENV["CAFMAL-API_CACHE_DB"].to_i,
      password: "foobar" || ENV["CAFMAL-API_CACHE_PASSWORD"],
      namespace: "cache"
    }

    config.middleware.use Rack::Attack
  end
end
