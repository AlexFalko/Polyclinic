class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    case user
    when Doctor then doctor_path(current_user.id)
    when Patient then patient_path(current_user.id)
    when AdminUser then admin_root_path
    else
      root_path
    end
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:warning] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:phone_number])
  end
end
