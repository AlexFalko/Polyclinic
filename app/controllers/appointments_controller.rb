class AppointmentsController < ApplicationController

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

end
