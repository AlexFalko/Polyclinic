class PatientsController < ApplicationController
  def show
    authorize Patient
    @categories = Category.includes([:doctors]).all.decorate
    @inactive_appointment = current_user.appointments.includes([:doctor]).inactive
  end
end
