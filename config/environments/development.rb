V1::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Expands the lines which load the assets
  config.assets.debug = true
  
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  
  MAIN_PAPERCLIP_STORAGE_OPTS = {
    :styles => {:main => '710X210>'},
    :convert_options => { :all => '-quality 80' }
  }
  LARGE_PAPERCLIP_STORAGE_OPTS = {
    :styles => {:main => '710X400>'},
    :convert_options => { :all => '-quality 80' }
  }
  SQUARE_PAPERCLIP_STORAGE_OPTS = {
    :styles => {:main => '300X300>'},
    :convert_options => { :all => '-quality 80' }
  }
  GRID_SQUARE_PAPERCLIP_STORAGE_OPTS = {
    :styles => {:main => '400X400>'},
    :convert_options => { :all => '-quality 80' }
  }
  FACEBOOK_PAPERCLIP_STORAGE_OPTS = {
    :styles => {:main => '1200X630>'},
    :convert_options => { :all => '-quality 80' }
  }

end