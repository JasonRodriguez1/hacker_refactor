class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username << :email << :password << :password_confirmation
  end

  private

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
