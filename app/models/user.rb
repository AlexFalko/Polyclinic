class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :category, optional: true

  def patient?
    type == 'Patient'
  end
  def doctor?
    type == 'Doctor'
  end
end
