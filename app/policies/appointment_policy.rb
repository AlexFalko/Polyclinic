class AppointmentPolicy < ApplicationPolicy
  attr_reader :user, :record

  def create?
    @user.present? && user.type == 'Patient'
  end

  def update?
    @user.present? && user.type == 'Doctor'
  end

  def edit?
    @user.present? && user.type == 'Doctor'
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
