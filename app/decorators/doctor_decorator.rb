class DoctorDecorator < Draper::Decorator
  delegate_all

  def patient_name
    appointment.patient.name
  end

end
