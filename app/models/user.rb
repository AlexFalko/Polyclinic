class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :category, optional: true
  has_many :appointments
  has_many :users, lambda {
    where(type: 'Doctor')
  }, through: :appointments

  has_many :users, lambda {
    where(type: 'Patient')
  }, through: :appointments

  def patient?
    type == 'Patient'
  end
  def doctor?
    type == 'Doctor'
  end
end
