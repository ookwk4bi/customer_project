class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery
  

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:given_name])
      
      devise_parameter_sanitizer.permit(:account_update, keys: [:family_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:given_name])
      
  end

end