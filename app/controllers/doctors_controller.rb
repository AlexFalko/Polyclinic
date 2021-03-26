class DoctorsController < ApplicationController
  def show
    authorize Doctor
    @active_patients = current_user.appointments.includes([:patient]).active.decorate
  end

  def update
    @doctor = Doctor.find_by(id: params[:id])

    if @doctor.update(doctor_params)
      redirect_to doctor_path, flash: { notice: 'Avatar save' }
    else
      redirect_to doctor_path, flash: { alert: 'Avatar dont save' }
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:avatar)
  end
end
