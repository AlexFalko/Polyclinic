class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone_number, uniqueness: true
  
  # Search user by mobile(not email)
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    where(phone_number: conditions[:phone_number]).first
  end

  # Stop using email as authentication key
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

