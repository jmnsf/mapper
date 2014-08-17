class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def client_ip
    request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip ||
    request.remote_addr || request.env['REMOTE_ADDR']
  end
end
