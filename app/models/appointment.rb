class Appointment < ApplicationRecord
  MAX_DOCTOR_APPOINTMENTS = 10

  enum status: { active: 1, inactive: 0 }
  belongs_to :user

end
