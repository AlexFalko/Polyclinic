class PatientPolicy < ApplicationPolicy
  attr_reader :user, :record

  def show?
    @user.present? && user.type == 'Patient'
  end


  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
