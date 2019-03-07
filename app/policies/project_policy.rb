class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def search?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  # def mine?
  #   true
  # end
end
