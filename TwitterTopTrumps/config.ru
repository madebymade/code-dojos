# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

unless Rails.env.development?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    config = Rails.application.config.http_auth
    username == config[:username] && password == config[:password]
  end
end
