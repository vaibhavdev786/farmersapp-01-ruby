require_relative 'boot'

require 'rails/all'
require 'dotenv/load'
require 'sqlite3'
require 'ostruct'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Agrimystic01Ruby
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.time_zone = 'Asia/Kolkata'
    config.active_record.default_timezone = :local
    config.x.base_url = ENV['BASE_URL'] || 'http://localhost:3000'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
