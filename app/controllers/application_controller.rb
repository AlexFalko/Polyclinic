class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    binding.pry
    case user
    when Doctor then doctor_path(current_user.id)
    when Patient then patient_path(current_user.id)
    else
      root_path
    end
  end

end
