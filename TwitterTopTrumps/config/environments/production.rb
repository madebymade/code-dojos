Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.log_level = :info
  config.log_tags = [ :subdomain, :uuid ]
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)
  # config.cache_store = :mem_cache_store
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  config.assets.enabled = true
  config.assets.compress = true
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass
  config.assets.compile = true
  config.assets.digest = true
  config.serve_static_files = false

  config.action_controller.asset_host = 'https://s3-eu-west-1.amazonaws.com/sslcatch/'
  config.action_mailer.asset_host = 'https://s3-eu-west-1.amazonaws.com/sslcatch/'
  config.action_mailer.default_url_options = { host: 'sslcatch.com' }
end
