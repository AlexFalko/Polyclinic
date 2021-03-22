class ApplicationController < ActionController::Base
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

end
