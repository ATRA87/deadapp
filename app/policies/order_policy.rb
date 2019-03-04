class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return record.project.user != user # A dev cant make an order for his own project
  end

  def update?
    record.user == user || record.project.user == user
  end
end
