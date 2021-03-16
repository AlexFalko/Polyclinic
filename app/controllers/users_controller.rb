class UsersController < ApplicationController
  def index
    if current_user.patient?
      render 'patients/index'
    elsif current_user.doctor?
      render 'doctors/index'

    end
  end
end
