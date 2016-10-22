require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Moks
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.encoding = "utf-8"
    config.middleware.insert 0, Rack::UTF8Sanitizer
    config.time_zone = 'Helsinki'
     # config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_types = [:datetime, :time]
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
    config.assets.precompile += Ckeditor.assets
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.precompile += %w(soundmanager2.swf soundmanager2_flash9.swf)
    config.assets.precompile += %w( .svg .eot .woff .ttf )
    config.assets.precompile += %w(  jquery.collapsible-menus.min.js)
  
    config.assets.precompile += %w{ admin.css }
  end
end

I18n.enforce_available_locales = false