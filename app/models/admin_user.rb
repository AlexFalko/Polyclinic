class AdminUser < ApplicationRecord
  validates :phone_number, uniqueness: true

  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    where(phone_number: conditions[:phone_number]).first
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
