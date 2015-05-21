module HttpAuth
  extend ActiveSupport::Concern

  included do
    before_action :authenticate if Rails.application.config.http_auth[:enabled]
  end

  def authenticate
    authenticate_or_request_with_http_basic(t(:http_challenge)) do |username, password|
      config = Rails.application.config.http_auth
      username == config[:username] and password == config[:password]
    end
  end
end
