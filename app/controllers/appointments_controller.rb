class AppointmentsController < ApplicationController
  before_action :require_create, only: [:create]
  def edit
    @appointment = Appointment.find_by(id: params[:id])
  end

  def create
   
    @appointment = Appointment.create(doctor_id: params[:doctor_id],
                                      patient_id: current_user.id,
                                      status: :active)
    
    if @appointment.save
      redirect_to patient_path(current_user.id), flash: { notice: "Appointment doctor" }
    else
      render 'patients#show', flash: { notice: "Appointment error" }
    end
  end
  

  def update
    @appointment = Appointment.find_by(id: params[:id])

    if @appointment.update(appointment_params)
      redirect_to doctor_path
    else
      render 'edit'
    end
  end

  private

  def appointment_params
    params.require(:appointment)
          .permit(:recommendation)
          .merge(status: :inactive)
  end


  def require_create
    doctor = Doctor.find(params[:doctor_id])

    if doctor.appointments.active.count >= Appointment::MAX_DOCTOR_APPOINTMENTS
      redirect_to patient_path(patient_id), flash: { alert: "t('.has_max_appointments')",
                                      max_doctor_appointments: Appointment::MAX_DOCTOR_APPOINTMENTS }
    end
  end

end
