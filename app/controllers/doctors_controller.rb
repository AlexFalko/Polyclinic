class DoctorsController < ApplicationController

  def show
    authorize Doctor
    @active_patients = current_user.appointments.includes([:patient]).active.decorate
  end
end
