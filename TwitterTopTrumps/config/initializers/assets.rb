Rails.application.config.assets.paths += [File.join(Rails.root, 'app', 'assets', 'fonts')]
Rails.application.config.assets.precompile += %w(application.js application.css)

Rails.application.config.assets.configure do |env|
  env.logger = Rails.logger
end

Rails.application.config.quiet_assets = true
