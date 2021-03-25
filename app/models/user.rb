class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates :avatar, file_size: { less_than: 1.megabytes }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone_number, uniqueness: true
  
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

