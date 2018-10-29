class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    permitted_user = User.find_by(authentication_token: "4d50016bbd955f2ea7306a3a64582d1f")
    if permitted_user
      true
    end
  end
end
