class DoctorPolicy < ApplicationPolicy
  attr_reader :user, :record

  def show?
    @user.present? && user.type == 'Doctor'
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
