require_relative "boot"
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Todo
  class Application < Rails::Application

    config.load_defaults 6.1
    config.i18n.available_locales = %i[en ru uk]
    config.i18n.default_locale = :ru
    config.time_zone = 'Kyiv'
    config.eager_load_paths += Dir["#{config.root}/lib/**/",
                                  "#{config.root}/config/locales/**/"]
    config.generators do |g|
      g.orm              :active_record
      g.template_engine  :slim
      g.system_tests     nil
      g.test_framework   nil
      g.helper           false
      g.stylesheets      false
      g.javascripts      false
    end
  end
end
