class ProjectAssetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.project.user == user
  end

  def destroy?
    record.project.user == user
  end
end
