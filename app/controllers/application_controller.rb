class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :employee_number, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:employee_number])
    # binding.pry
  end
end
