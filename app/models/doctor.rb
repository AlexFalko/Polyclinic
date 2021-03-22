class Doctor < User
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :category, optional: true
end
