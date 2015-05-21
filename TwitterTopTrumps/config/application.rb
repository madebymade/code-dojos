require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SSLCatch
  class Application < Rails::Application
    config.to_prepare do
      Dir[Rails.root.join('{app,lib}/**/*_decorator*.rb')].each do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.autoload_paths << Rails.root.join('lib')

    config.active_record.raise_in_transactional_callbacks = true
    config.action_view.raise_on_missing_translations = true
    config.active_job.queue_adapter = :delayed_job
    config.action_mailer.preview_path = Rails.root.join('spec/mailer_previews')

    config.force_ssl = true

    config.http_auth = { enabled: false,
                         username: 'sslcatch',
                         password: 'coolkids' }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings =
      { address: 'smtp.mandrillapp.com',
        port: 587,
        user_name: 'accounts@madetech.co.uk',
        password: '1eLOSoEeFLa4ERnusdmnWw',
        authentication: 'plain',
        enable_starttls_auto: true }

    require Rails.root.join('app/helpers/form_builder')
    config.action_view.default_form_builder = FormBuilder
  end
end
