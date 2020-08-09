require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module Myapp
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.assets.paths << "#{Rails}/vendor/assets/fonts"
    config.assets.paths << "#{Rails}/vendor/assets/plugins"
    config.autoload_paths += %W(#{config.root}/lib)
    config.enable_dependency_loading = true 
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: ENV["SMTP_HOST"],
      port: ENV["SMTP_PORT"],
    }
    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework :rspec,
                        model_specs: true,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false,
                        controller_specs: false,
                        request_specs: false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
