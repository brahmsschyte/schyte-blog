class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def user_not_authorized
    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_url)
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :telegram])
  end
end
