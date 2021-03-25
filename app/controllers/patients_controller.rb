class PatientsController < ApplicationController
  def show
    authorize Patient
    @categories = Category.includes([:doctors]).all.decorate
    @inactive_appointment = current_user.appointments.includes([:doctor]).inactive
  end

  def update
    @patient = Patient.find_by(id: params[:id])
    # binding.pry
    if @patient.update(patient_params)
      redirect_to patient_path, flash: { notice: "Avatar save" }
    else
      redirect_to patient_path, flash: { alert: "Avatar dont save" }
    end
  end
  
  private

  def patient_params
    params.require(:patient).permit(:avatar)
  end
  
end
